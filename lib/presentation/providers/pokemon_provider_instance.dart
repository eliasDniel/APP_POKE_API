import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/infrastructure.dart';

<<<<<<< HEAD

=======
>>>>>>> dda8d96e577d2b9ab33ca7e8745f090f15b63939
// * PROVIDER DE POKEMON INSTANCE
final pokemonProviderInstance = Provider((ref) {
  return PokemonRepositoryImpl(PokemonDatasourceImpl());
});
