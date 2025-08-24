





import 'package:flutter_poke_api/domain/entities/pokemon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



typedef PokemonCallback = Future<List<Pokemon>> Function({int limit, int offset});

class PokemonNotifier extends StateNotifier<List<Pokemon>>{
  PokemonNotifier() : super([]);
  bool isLoading = false;

  Future<void> fetchPokemons(PokemonCallback fetchPokemons) async {
    isLoading = true;
    final pokemons = await fetchPokemons();
    state = [...state, ...pokemons];
    isLoading = false;
  }

}