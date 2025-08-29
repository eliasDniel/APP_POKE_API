import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/domain.dart';
import 'package:flutter_poke_api/presentation/widgets/pokemon_description.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../widgets/color_and_size.dart';
import '../widgets/pokemon_title_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    Color getTypeColor(String type) {
      switch (type.toLowerCase()) {
        case 'grass':
          return Color(0xFF4CAF50);
        case 'fire':
          return Color(0xFFFF5722);
        case 'water':
          return Color(0xFF2196F3);
        case 'bug':
          return Color(0xFF8BC34A);
        default:
          return Color(0xFF4CAF50);
      }
    }

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // each product have a color
      backgroundColor: getTypeColor(
        pokemon.types[0].type.name,
      ).withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Add your favorite logic here if needed
            },
            icon: Icon(Icons.favorite_border_rounded, color: Colors.white),
          ),
          const SizedBox(width: kDefaultPaddin / 2),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    // height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pokemon.name.toUpperCase(),
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              
                              const SizedBox(height: kDefaultPaddin),
                              Text(
                                'N°${pokemon.id}',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      color: const Color.fromARGB(138, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: kDefaultPaddin),
                              ColorAndSize(pokemon: pokemon),
                              SizedBox(height: kDefaultPaddin / 2),
                              Text(
                                'Este Pokémon es conocido por su gran energía y habilidades únicas. Es muy popular entre los entrenadores por su apariencia y destreza en batalla.',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: Colors.black87),
                              ),
                              SizedBox(height: kDefaultPaddin / 2),
                              PokemonDescription(pokemon: pokemon),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ProductTitleWithImage(pokemon: pokemon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
