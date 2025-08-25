import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/entities/pokemon.dart';

import '../../config/config.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.pokemon, required this.press});

  final Pokemon pokemon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                color: const Color(0xFF3D82AE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${pokemon.id}",
                child: Image.network(pokemon.sprites.frontDefault),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              pokemon.name,
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${pokemon.species.name}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
