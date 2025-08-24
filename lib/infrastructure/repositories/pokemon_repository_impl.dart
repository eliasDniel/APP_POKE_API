



import '../../domain/datasources/pokemon_datasource.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';

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