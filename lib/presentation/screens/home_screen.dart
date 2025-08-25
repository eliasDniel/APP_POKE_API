import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../providers/providers.dart';
import '../widgets/item_card.dart';
import 'pokemon_screen.dart';

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
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin, vertical: 12),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pokemons",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SvgPicture.asset(
                    'assets/icons/search.svg',
                    height: 28,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ItemCard(
                  pokemon: pokemons[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(pokemon: pokemons[index]),
                    ),
                  ),
                ),
                childCount: pokemons.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
