


import '../entities/pokemon.dart';
// import '../entities/region.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getAllPokemons({int limit=10, int offset=20});
  Future<Pokemon> getPokemonById(int id);
  Future<List<Pokemon>> getPokemonsByType(String type);
  
}
