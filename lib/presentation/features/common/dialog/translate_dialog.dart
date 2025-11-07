import 'package:easy_english/presentation/features/bloc/translate/translate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:translator/translator.dart';

import '../../../../core/constants/debouncer.dart';
import '../../../../core/constants/languages.dart';
import '../../../../core/utils/widgets/language_picker_dialog.dart';
import '../../../../core/utils/widgets/rounded_button.dart';
import '../../../../di/injector.dart' as di;

class TranslateDialog extends StatefulWidget {
  const TranslateDialog({super.key});

  @override
  State<TranslateDialog> createState() => _TranslateDialogState();
}

class _TranslateDialogState extends State<TranslateDialog> {
  late TextEditingController _sourceController;
  late TextEditingController _targetController;
  String translatedText = '';
  bool isLoading = false;
  String translationMode = 'en_vi';
  final AudioPlayer _player = AudioPlayer();
  String audioUrl = '';
  late ScrollController _scrollController;
  Language _source = Language.languages.firstWhere(
    (element) => element.code == 'en',
  );
  Language _target = Language.languages.firstWhere(
    (element) => element.code == 'vi',
  );
  final Debouncer _debouncer = Debouncer(delay: Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _sourceController = TextEditingController();
    _targetController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  void _playSound(String url) async {
    try {
      await _player.setUrl(url);
      await _player.play();
    } catch (e) {
      debugPrint('skip');
    }
  }

  void _translate(String text, String from, String to) async {
    final GoogleTranslator translator = GoogleTranslator();

    try {
      final Translation translation = await translator.translate(
        text,
        from: from,
        to: to,
      );
      final String translatedText = translation.text;
      _targetController.text = translatedText;
    } catch (e) {
      _targetController.text = 'Can not translate';
      debugPrint('skip');
    }
  }

  void _onDelete() {
    _targetController.clear();
    _sourceController.clear();
  }

  void _onCopy() {
    if (_targetController.text.isEmpty) {
      return;
    }
    Clipboard.setData(ClipboardData(text: _targetController.text));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Copied to clipboard")));
  }

  void _onSwitch() {
    setState(() {
      final temp = _source;
      _source = _target;
      _target = temp;
    });
    _sourceController.text = _targetController.text;
    _translate(_sourceController.text, _source.code, _target.code);
  }

  void _onPick(String translation) {
    _sourceController.text = translation;
    _translate(_sourceController.text, _source.code, _target.code);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<TranslateBloc>(),
      child: BlocBuilder<TranslateBloc, TranslateState>(
        builder: (context, state) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(
                      width: 600,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.translate),
                              ),
                              Text(
                                "Translate",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.titleSmall,
                              children: [
                                // const TextSpan(text: "Source: "),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: RoundedButton(
                                    expand: false,
                                    padding: EdgeInsets.all(4.0),
                                    borderRadius: 8,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder:
                                            (_) => LanguagePickerDialog(
                                              onChanged: (language) {
                                                setState(() {
                                                  _source = language;
                                                });
                                                _translate(_sourceController.text, _source.code, _target.code);
                                              },
                                            ),
                                      );
                                    },
                                    child: Text(_source.name),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _sourceController,
                                  onChanged: (value) {
                                    _debouncer(() {
                                      _translate(_sourceController.text, _source.code, _target.code);
                                    });
                                  },
                                  maxLines: 1,
                                  onSubmitted: (value) {
                                    _translate(_sourceController.text, _source.code, _target.code);
                                  },
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Type your translation here",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor:
                                        Theme.of(
                                          context,
                                        ).colorScheme.primaryContainer,
                                  ),
                                ),
                              ),
                              if (_sourceController.text.isNotEmpty)
                                IconButton(
                                  onPressed: _onDelete,
                                  icon: Icon(
                                    Icons.cancel,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 16,
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary.withAlpha(100),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _onSwitch,
                                  icon: Icon(
                                    Icons.swap_vert,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary.withAlpha(100),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.titleSmall,
                              children: [
                                // const TextSpan(text: "Target: "),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: RoundedButton(
                                    expand: false,
                                    padding: EdgeInsets.all(4.0),
                                    borderRadius: 8,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder:
                                            (_) => LanguagePickerDialog(
                                              onChanged: (language) {
                                                setState(() {
                                                  _target = language;
                                                });
                                                _translate(_sourceController.text, _source.code, _target.code);
                                              },
                                            ),
                                      );
                                    },
                                    child: Text(_target.name),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  enabled: false,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  controller: _targetController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Translation will appear here",
                                  ),
                                ),
                              ),
                              // if (state.translateSnapshot != null && state.translateSnapshot!.type != null)
                              //   FilterChip(
                              //     label: Text(state.translateSnapshot!.type!),
                              //     onSelected: (value) {},
                              //     selected: true,
                              //     showCheckmark: false,
                              //   ),
                              // if ((state.translateSnapshot?.content ?? "").isNotEmpty) IconButton(
                              //   onPressed: _onCopy,
                              //   icon: Icon(
                              //     Icons.copy,
                              //     color: Theme.of(context).colorScheme.primary,
                              //     size: 16,
                              //   ),
                              // )
                            ],
                          ),
                          // if (state.translateSnapshot?.spelling != null)
                          //   Text(state.translateSnapshot!.spelling!, style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 8),
                          RoundedButton(
                            borderRadius: 16,
                            child: Text("Translate"),
                            onPressed: () {
                              if (_sourceController.text.isEmpty) {
                                return;
                              }
                              _translate(_sourceController.text, _source.code, _target.code);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
