import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/entities/pokemon.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/pokemon_type_utils.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.pokemon, required this.press});
  final Pokemon pokemon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final String mainType = pokemon.types.isNotEmpty
        ? pokemon.types[0].type.name
        : '';
    final Color bgColor = getTypeColor(mainType);
    return FadeInUp(
      from: random.nextInt(100) + 80,
      delay: Duration(milliseconds: random.nextInt(450) + 0),
      child: GestureDetector(
        onTap: () => context.push('/home/2/movie/${pokemon.id}'),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              // Fondo: icono del tipo de Pokémon grande y opaco
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  getTypeIcon(mainType),
                  size: 100,
                  color: Colors.white.withOpacity(0.18),
                ),
              ),
              // Info: número, nombre y tipos
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'N°${pokemon.id.toString().padLeft(3, '0')}',
                      style:  GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black26)],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      pokemon.name,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black26)],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pokemon.types
                          .map(
                            (type) => Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.18),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  type.type.name,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              // Imagen del Pokémon
              Transform.translate(
                offset: const Offset(30, 100),
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: FadeInImage(
                    height: 120,
                    fit: BoxFit.contain,
                    placeholder: AssetImage('assets/loaders/bottle-loader.gif'),
                    image: NetworkImage(pokemon.sprites.frontDefault),
                    imageErrorBuilder: (context, error, stackTrace) {
                      // Si falla la imagen, muestra solo el loader
                      return Image.asset(
                        'assets/loaders/bottle-loader.gif',
                        height: 120,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
