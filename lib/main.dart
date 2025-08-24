import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/providers/providers.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen());
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    ref.read(pokemonProvider.notifier).fetchPokemonsMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemons = ref.watch(pokemonProvider);
    final isLoading = ref.watch(pokemonProvider.notifier).isLoading;
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return Card(
            child: Column(
              children: [
                FadeInImage(
                  placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
                  image: NetworkImage(pokemon.sprites.frontDefault),
                ),
                Text(pokemon.name),
                // Aquí puedes agregar más información sobre el Pokémon
              ],
            ),
          );
        },
        itemCount: pokemons.length,
      ),
    );
  }
}
