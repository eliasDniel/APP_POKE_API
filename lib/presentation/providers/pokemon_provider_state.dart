





import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import 'providers.dart'; 


// * PROVIDER DE POKEMON
final pokemonProvider = StateNotifierProvider<PokemonNotifier, List<Pokemon>>((ref) {
  final fetchPokemons = ref.watch(pokemonProviderInstance).getAllPokemons;
  return PokemonNotifier(fetchPokemons: fetchPokemons);
});



typedef PokemonCallback = Future<List<Pokemon>> Function({int limit, int offset});

class PokemonNotifier extends StateNotifier<List<Pokemon>>{
  final PokemonCallback fetchPokemons;
  PokemonNotifier({
    required this.fetchPokemons
  }) : super([]);

  bool isLoading = false;

  Future<void> fetchPokemonsMethod() async {
    isLoading = true;
    final pokemons = await fetchPokemons();
    state = [...state, ...pokemons];
    isLoading = false;
  }

}