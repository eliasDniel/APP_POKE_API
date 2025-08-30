import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/domain.dart';
import 'package:flutter_poke_api/presentation/widgets/pokemon_description.dart';
// import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../widgets/pokemon_type.dart';
import '../widgets/pokemon_title_image.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String selectedImageUrl;

  @override
  void initState() {
    super.initState();
    // Inicializar con la imagen frontal normal
    selectedImageUrl = widget.pokemon.sprites.frontDefault;
  }

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

  void _onVersionSelected(String imageUrl) {
    setState(() {
      selectedImageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // each product have a color
      backgroundColor: getTypeColor(
        widget.pokemon.types[0].type.name,
      ).withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
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
                                widget.pokemon.name.toUpperCase(),
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),

                              const SizedBox(height: kDefaultPaddin),
                              Text(
                                'N°${widget.pokemon.id}',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      color: const Color.fromARGB(138, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: kDefaultPaddin),
                              ColorAndSize(pokemon: widget.pokemon),
                              SizedBox(height: kDefaultPaddin / 2),

                              Text(
                                'VERSIONES',
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: kDefaultPaddin / 2),
                              _buildPokemonVersions(),
                              SizedBox(height: kDefaultPaddin),

                              PokemonDescription(pokemon: widget.pokemon),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Pasar la imagen seleccionada al widget de imagen principal
                  ProductTitleWithImage(
                    pokemon: widget.pokemon,
                    customImageUrl: selectedImageUrl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonVersions() {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildVersionCard(
            'Normal',
            widget.pokemon.sprites.frontDefault,
            selectedImageUrl == widget.pokemon.sprites.frontDefault,
          ),
          _buildVersionCard(
            'Shiny',
            widget.pokemon.sprites.frontShiny,
            selectedImageUrl == widget.pokemon.sprites.frontShiny,
          ),
          _buildVersionCard(
            'Back',
            widget.pokemon.sprites.backDefault,
            selectedImageUrl == widget.pokemon.sprites.backDefault,
          ),
          _buildVersionCard(
            'Back Shiny',
            widget.pokemon.sprites.backShiny,
            selectedImageUrl == widget.pokemon.sprites.backShiny,
          ),
        ],
      ),
    );
  }

  Widget _buildVersionCard(
    String versionName,
    String? imageUrl,
    bool isSelected,
  ) {
    if (imageUrl == null) return SizedBox.shrink();

    return GestureDetector(
      onTap: () => _onVersionSelected(imageUrl),
      child: Container(
        width: 80,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: isSelected
                    ? getTypeColor(
                        widget.pokemon.types[0].type.name,
                      ).withOpacity(0.3)
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: isSelected
                    ? Border.all(
                        color: getTypeColor(widget.pokemon.types[0].type.name),
                        width: 2,
                      )
                    : null,
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, color: Colors.grey);
                },
              ),
            ),
            SizedBox(height: 5),
            Text(
              versionName,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected
                    ? getTypeColor(widget.pokemon.types[0].type.name)
                    : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
