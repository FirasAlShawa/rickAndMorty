import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/characters/providers/get_all_character_provider.dart';
import 'package:rick_and_morty/characters/views/characters_view_providers.dart';
import 'package:rick_and_morty/core/models/character.dart';
import 'package:rick_and_morty/core/widgets/rk_text.dart';

enum ViewType {
  list,
  grid;
}

class CharactersView extends ConsumerWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F5),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    ref.read(listGridProvider.notifier).state = ViewType.list;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ref.watch(listGridProvider) == ViewType.list
                            ? Colors.grey
                            : Colors.grey.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: const Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ref.read(listGridProvider.notifier).state = ViewType.grid;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ref.watch(listGridProvider) == ViewType.grid
                            ? Colors.grey
                            : Colors.grey.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: const Icon(
                      Icons.grid_3x3_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ref.watch(getAllCharacterProvider).when(
              data: (List<Character> characters) {
                return ref.watch(listGridProvider) == ViewType.list
                    ? Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) =>
                                listItem(context, characters[index]),
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 8,
                              );
                            },
                            itemCount: characters.length),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GridView.builder(
                            itemCount: characters.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemBuilder: (context, index) {
                              return gridItem(context, characters[index]);
                            },
                          ),
                        ),
                      );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget gridItem(BuildContext context, Character character) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(character.image),
          ),
          const SizedBox(
            height: 4,
          ),
          RkText.smallBoldLabel(
            character.name,
          ),
        ],
      ),
    );
  }

  Container listItem(BuildContext context, Character character) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(character.image),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RkText.smallBoldLabel(
                  character.name,
                ),
                const SizedBox(
                  height: 4,
                ),
                RkText.xSmallBoldLabel(
                  character.species,
                ),
              ],
            ),
          ),
          Column(
            children: [
              RkText.xSmallBoldLabel(
                character.status,
              ),
              RawChip(
                backgroundColor: const Color(0xffe4f1ff),
                label: RkText.xSmallBoldLabel(
                  character.gender,
                  color: const Color(0xff016fff),
                ),
                labelPadding: EdgeInsets.zero,
                side: BorderSide.none,
                shape: const StadiumBorder(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
