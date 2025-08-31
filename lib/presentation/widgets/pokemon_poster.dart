import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/domain.dart';
import '../utils/pokemon_type_utils.dart';

class PokemonPoster extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonPoster({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final String mainType = pokemon.types.isNotEmpty ? pokemon.types[0].type.name : '';
    final Color bgColor = getTypeColor(mainType); // Importar getTypeColor desde utils/pokemon_type_utils.dart
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            // Lado izquierdo: número, nombre y tipos
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'N° 00${pokemon.id}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(pokemon.name, style:  TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: pokemon.types
                          .map(
                            (type) => Container(
                              margin: const EdgeInsets.only(right: 6),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: getTypeColor(type.type.name),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(getTypeIcon(type.type.name),color: Colors.white,),
                                  Text(
                                    type.type.name,
                                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            // Lado derecho: Fondo según tipo principal
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),

                child:Image.network( pokemon.sprites.frontDefault ),
                // Aquí puedes agregar la imagen del Pokémon o un CustomPaint si lo deseas
                // child: CustomPaint(
                //   painter: getTypePainter(mainType),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
