import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/infrastructure.dart';



final pokemonProviderInstance = Provider((ref) {
  return PokemonRepositoryImpl(PokemonDatasourceImpl());
});
