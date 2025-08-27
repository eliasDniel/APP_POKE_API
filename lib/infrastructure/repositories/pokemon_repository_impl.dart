

<<<<<<< HEAD


import '../../domain/domain.dart';
=======
import '../../domain/datasource/pokemon_datasource.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repositories.dart';
>>>>>>> dda8d96e577d2b9ab33ca7e8745f090f15b63939

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource dataSource;

  PokemonRepositoryImpl(this.dataSource);

  @override
  Future<List<Pokemon>> getAllPokemons({int limit = 10, int offset = 0}) {
    return dataSource.getAllPokemons(limit: limit, offset: offset);
  }

  @override
  Future<Pokemon> getPokemonById(int id) {
    return dataSource.getPokemonById(id);
  }

  @override
  Future<List<Pokemon>> getPokemonsByType(String type) {
    return dataSource.getPokemonsByType(type);
  }
}