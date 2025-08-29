import 'package:dio/dio.dart';
import 'package:flutter_poke_api/infrastructure/mappers/pokemon_mappers.dart';

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
    final futures = (response.data['results'] as List).asMap().entries.map((
      entry,
    ) {
      final index = entry.key + 1 + offset; // id del pokemon
      return dio.get('pokemon/$index');
    }).toList();
    final responses = await Future.wait(futures);
    final pokemones = responses
        .map((res) => PokemonMapper.toEntity(PokemonResult.fromJson(res.data)))
        .toList();
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

  @override
  Future<Pokemon> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }
}
