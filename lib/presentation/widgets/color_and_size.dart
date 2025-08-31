import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/domain.dart';

import '../../config/config.dart';
import '../utils/pokemon_type_utils.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    // La función getTypeColor ha sido eliminada y ahora se importa desde utils/pokemon_type_utils.dart
    // Asegúrate de importar: import '../utils/pokemon_type_utils.dart';

    IconData getTypeIcon(String type) {
      switch (type.toLowerCase()) {
        case 'fire':
          return Icons.local_fire_department;
        case 'water':
          return Icons.water_drop;
        case 'grass':
          return Icons.eco;
        case 'electric':
          return Icons.flash_on;
        case 'bug':
          return Icons.bug_report;
        case 'flying':
          return Icons.air;
        case 'poison':
          return Icons.science;
        case 'ground':
          return Icons.landscape;
        case 'fairy':
          return Icons.auto_awesome;
        case 'fighting':
          return Icons.sports_mma;
        case 'psychic':
          return Icons.visibility;
        case 'rock':
          return Icons.terrain;
        case 'ghost':
          return Icons.nightlight_round;
        case 'ice':
          return Icons.ac_unit;
        case 'dragon':
          return Icons.whatshot;
        case 'dark':
          return Icons.dark_mode;
        case 'steel':
          return Icons.build;
        default:
          return Icons.circle;
      }
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                spacing: 8,
                children: pokemon.types.map((typeInfo) {
                  final typeName = typeInfo.type.name;
                  return Chip(
                    avatar: Icon(
                      getTypeIcon(typeName),
                      color: Colors.white,
                      size: 18,
                    ),
                    label: Text(
                      typeName[0].toUpperCase() + typeName.substring(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: getTypeColor(typeName),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        // Expanded(
        //   child: RichText(
        //     text: TextSpan(
        //       style: const TextStyle(color: kTextColor),
        //       children: [
        //         const TextSpan(text: "Tamaño\n"),
        //         TextSpan(
        //           text: "${pokemon.height} m",
        //           style: Theme.of(
        //             context,
        //           ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? color : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
