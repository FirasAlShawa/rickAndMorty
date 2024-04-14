import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/characters/repository/character_repository.dart';
import 'package:rick_and_morty/core/models/character.dart';
import 'package:rick_and_morty/core/network/endpoints/endpoints.dart';
import 'package:rick_and_morty/core/network/providers/dio_client_provider.dart';

final remoteCharacterRepositoryProvider = Provider(
  (ref) => RemoteCharacterRepository(
    ref.watch(dioClientProvider),
  ),
);

class RemoteCharacterRepository implements CharacterRepository {
  final Dio dioClient;

  RemoteCharacterRepository(this.dioClient);

  @override
  Future<void> filterCharactersBy() {
    // TODO: implement filterCharactersBy
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> getAllCharacters() async {
    final Response response =
        await dioClient.get(RickAndMortyEndPoints.getAllCharacter);
    List<dynamic> resultList = response.data['results'];
    return resultList.map((e) => Character.fromJson(e)).toList();
  }

  @override
  Future<void> getCharacterById(int id) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }

  @override
  Future<void> getMultipleCharacter(List<int> ids) {
    // TODO: implement getMultipleCharacter
    throw UnimplementedError();
  }
}
