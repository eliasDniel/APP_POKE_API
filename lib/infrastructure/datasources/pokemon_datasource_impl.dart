

import 'package:dio/dio.dart';

import '../../domain/domain.dart';
import '../infrastructure.dart';

class PokemonDatasourceImpl implements PokemonDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
      queryParameters: {'language': 'es-mx'},
    ),
  );
  @override
  Future<List<Pokemon>> getAllPokemons({int limit = 10, int offset = 0}) async {
    final response = await dio.get(
      'pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );
    final pokemonsResponse = [];

    for (var i in response.data['results']) {
      final pokemon = await dio.get(i['url']);
      final pokemonResponse = PokemonResult.fromJson(pokemon.data);
      pokemonsResponse.add(pokemonResponse);
    }
    final pokemones = pokemonsResponse.map((e) => PokemonMapper.toEntity(e)).toList();

    return pokemones;
  }

  @override
  Future<Pokemon> getPokemonById(int id) {
    // TODO: implement getPokemonById
    throw UnimplementedError();
  }

  @override
  Future<List<Pokemon>> getPokemonsByType(String type) {
    // TODO: implement getPokemonsByType
    throw UnimplementedError();
  }
}
