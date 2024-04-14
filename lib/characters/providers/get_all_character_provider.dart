import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/characters/repository/remote_character_repository.dart';
import 'package:rick_and_morty/core/models/character.dart';

final getAllCharacterProvider = FutureProvider<List<Character>>((ref) {
  return ref.watch(remoteCharacterRepositoryProvider).getAllCharacters();
});
