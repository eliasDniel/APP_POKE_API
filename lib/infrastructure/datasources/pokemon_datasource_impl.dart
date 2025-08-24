import 'package:dio/dio.dart';

import '../../domain/datasources/pokemon_datasource.dart';
import '../../domain/entities/pokemon.dart';
import '../models/pokemon_list_response.dart';

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
    final pokemonResponse = PokemonListResponse.fromJson(response.data);
    return [];
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
