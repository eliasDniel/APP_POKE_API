import '../entities/pokemon.dart';

abstract class PokemonDataSource {
  Future<List<Pokemon>> getAllPokemons({int limit=10, int offset=0});
  Future<Pokemon> getPokemonById(int id);
  Future<List<Pokemon>> getPokemonsByType(String type);
}
