import 'package:easy_english/domain/entities/dictionary/dictionary_entity.dart';
import 'package:easy_english/presentation/features/bloc/translate/translate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:translator/translator.dart';

import '../../../../di/injector.dart' as di;

class TranslateDialog extends StatefulWidget {
  const TranslateDialog({super.key});

  @override
  State<TranslateDialog> createState() => _TranslateDialogState();
}

class _TranslateDialogState extends State<TranslateDialog> {
  final TextEditingController textController = TextEditingController();
  String translatedText = '';
  bool isLoading = false;
  String translationMode = 'en_vi';
  final AudioPlayer _player = AudioPlayer();
  String audioUrl = '';

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    textController.dispose();
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

  Future<String> _translate(String text, String from, String to) async {
    final GoogleTranslator translator = GoogleTranslator();

    try {
      final Translation translation = await translator.translate(
        text,
        from: from,
        to: to,
      );
      final String translatedText = translation.text;
      final String englishWord = (from == 'en') ? text : translatedText;
      final String vietnameseWord = (from == 'vi') ? text : translatedText;

      return translatedText;
    } catch (e) {
      return 'Đã xảy ra lỗi khi dịch. Vui lòng thử lại.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<TranslateBloc>(),
      child: BlocBuilder<TranslateBloc, TranslateState>(
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Translate'),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  DropdownButtonFormField<String>(
                    initialValue: translationMode,
                    items: const [
                      DropdownMenuItem(
                        value: 'en_vi',
                        child: Text('Anh -> Việt'),
                      ),
                      DropdownMenuItem(
                        value: 'vi_en',
                        child: Text('Việt -> Anh'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        translationMode = value!;
                        textController.clear();
                        translatedText = '';
                        audioUrl = '';
                      });
                    },
                    dropdownColor: const Color(0xFF3C3C3E),
                    style: const TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.white70,
                    decoration: const InputDecoration(
                      labelText: 'Chế độ dịch',
                      labelStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildInputArea(state.dictionaries),
                  const SizedBox(height: 12),
                  const Divider(color: Colors.white24),
                  const SizedBox(height: 12),
                  _buildOutputArea(translatedText, state.isLoading),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.white70),
                child: const Text('Hủy'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed:
                    isLoading
                        ? null
                        : () async {
                          final textToTranslate = textController.text;
                          if (textToTranslate.isEmpty) {
                            return;
                          }

                          final String from = translationMode.split('_')[0];
                          final String to = translationMode.split('_')[1];

                          setState(() {
                            isLoading = true;
                            translatedText = '';
                          });

                          final String result = await _translate(
                            textToTranslate,
                            from,
                            to,
                          );

                          if (translationMode == 'en_vi') {
                            context.read<TranslateBloc>().add(
                              TranslateEvent.translateWord(textToTranslate),
                            );
                          }

                          setState(() {
                            translatedText = result;
                            isLoading = false;
                          });
                        },
                child:
                    isLoading
                        ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                        : const Text('Dịch'),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOutputArea(String translatedText, bool isLoading) {
    Widget content;

    if (isLoading) {
      content = Text(
        'Đang dịch...',
        style: TextStyle(
          color: Colors.white54,
          fontSize: 18.sp,
          fontStyle: FontStyle.italic,
        ),
      );
    } else if (translatedText.isEmpty) {
      content = Text(
        'Bản dịch',
        style: TextStyle(
          color: Colors.white54,
          fontSize: 18.sp,
          fontStyle: FontStyle.italic,
        ),
      );
    } else {
      content = Text(
        translatedText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Container(
      width: double.maxFinite,
      constraints: const BoxConstraints(minHeight: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          content,
          // if (translatedText.isNotEmpty && !isLoading && translationMode == 'vi_en')
          //   Padding(
          //     padding: const EdgeInsets.only(top: 8.0, left: 4.0),
          //     child: Text(
          //       translatedText,
          //       style: TextStyle(
          //         color: Colors.white70,
          //         fontSize: 16,
          //         fontStyle: FontStyle.italic,
          //       ),
          //     ),
          //   ),
          // if (translatedText.isNotEmpty && !isLoading && translationMode == 'vi_en') ...[
          //   const SizedBox(height: 8),
          //   IconButton(
          //     icon: const Icon(Icons.volume_up_outlined, color: Colors.white70),
          //     onPressed: () {
          //       // _playSound(translatedText);
          //     },
          //   ),
          // ],
        ],
      ),
    );
  }

  Widget _buildInputArea(List<DictionaryEntity> dictionaries) {
    final e = dictionaries.firstWhere(
      (element) => element.word == textController.text,
      orElse: () => DictionaryEntity(),
    );

    final phoneticsList = e.phonetics ?? [];
    audioUrl =
        phoneticsList
            .map((p) => p.audio)
            .firstWhere(
              (audio) => audio?.isNotEmpty ?? false,
              orElse: () => '',
            ) ??
        '';

    final String text =
        phoneticsList
            .map((p) => p.text)
            .firstWhere((txt) => txt?.isNotEmpty ?? false, orElse: () => '') ??
        '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: textController,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: "Nhập văn bản",
                      labelStyle: TextStyle(
                        color: Colors.white54,
                        fontSize: 16.sp,
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (textController.text.isNotEmpty && text.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (textController.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white54),
                onPressed: () => textController.clear(),
              ),
          ],
        ),
        if (translationMode == 'en_vi')
          IconButton(
            icon: const Icon(Icons.volume_up_outlined, color: Colors.white70),
            onPressed:
                audioUrl.isNotEmpty
                    ? () {
                      _playSound(audioUrl);
                    }
                    : null,
          ),
      ],
    );
  }
}
