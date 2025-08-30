import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/entities/pokemon.dart';

import '../../config/config.dart';

class ProductTitleWithImage extends StatelessWidget {
  final String? customImageUrl;
  const ProductTitleWithImage({super.key, required this.pokemon, this.customImageUrl});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: "${pokemon.id}",
                  child: Image.network(
                    customImageUrl ?? pokemon.sprites.frontDefault,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
