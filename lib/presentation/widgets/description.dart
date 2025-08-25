import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/entities/pokemon.dart';

import '../../config/config.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        pokemon.sprites.backShiny,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
