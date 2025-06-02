import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final bool isSearch;

  const SearchBox({super.key, required this.isSearch});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

enum ExerciseFilter { walking, running, cycling, hiking, a, c, d }

class _SearchBoxState extends State<SearchBox> {
  Set<ExerciseFilter> filters = <ExerciseFilter>{};

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AnimatedContainer(
        height: widget.isSearch ? 250 : 0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: colorScheme.onPrimary),
        duration: const Duration(milliseconds: 300),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Text('Word Pos: ', style: textScheme.labelLarge),
                    const SizedBox(width: 5.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filters.length,
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          ExerciseFilter.values.map((ExerciseFilter exercise) {
                            return FilterChip(
                              label: Text(exercise.name),
                              selected: filters.contains(exercise),
                              onSelected: (bool selected) {
                                setState(() {
                                  if (selected) {
                                    filters.add(exercise);
                                  } else {
                                    filters.remove(exercise);
                                  }
                                });
                              },
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10.0),
              // SizedBox(
              //   child: Text(
              //     'Looking for: ${filters.map((ExerciseFilter e) => e.name).join(', ')}',
              //     style: textScheme.labelLarge,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
