class RickAndMortyEndPoints {
  static const String getAllCharacter = "/character";
  static String getCharacterById(int id) => "/character/$id";
  static String getMultipleCharacter(List<int> ids) =>
      "/character/${ids.toString()}";
  static String filterCharactersBy(Map<String, dynamic> filterParams) =>
      "/character/${filterParams.toString()}";
}
