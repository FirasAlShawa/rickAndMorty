import 'package:rick_and_morty/core/models/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getAllCharacters();
  Future<void> getCharacterById(int id);
  Future<void> getMultipleCharacter(List<int> ids);
  Future<void> filterCharactersBy();
}
