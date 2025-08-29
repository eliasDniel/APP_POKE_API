import 'package:flutter/material.dart';

class RegionView extends StatelessWidget {
  // final Pokemon pokemon;
  const RegionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Regiones",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _RegionCard(
              name: 'Kanto',
              generation: '1ª GERAÇÃO',
              backgroundImage: 'assets/images/kanto_bg.jpg',
              pokemonIcons: [
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png',
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/37.png',
              ],
              onTap: () {
                // Navigate to Kanto region
              },
            ),
            const SizedBox(height: 16),
            _RegionCard(
              name: 'Johto',
              generation: '2ª GERAÇÃO',
              backgroundImage: 'assets/images/johto_bg.jpg',
              pokemonIcons: [
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png',
              ],
              onTap: () {
                // Navigate to Johto region
              },
            ),
            const SizedBox(height: 16),
            _RegionCard(
              name: 'Hoenn',
              generation: '3ª GERAÇÃO',
              backgroundImage: 'assets/images/hoenn_bg.jpg',
              pokemonIcons: [
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png',
              ],
              onTap: () {
                // Navigate to Hoenn region
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RegionCard extends StatelessWidget {
  // final Pokemon pokemon;
  const _RegionCard({
    required this.name,
    required this.generation,
    required this.backgroundImage,
    required this.pokemonIcons,
    required this.onTap,
  });

  final String name;
  final String generation;
  final String backgroundImage;
  final List<String> pokemonIcons;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.asset(
                  backgroundImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.withOpacity(0.8),
                            Colors.purple.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Dark overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.3),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Text content
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            generation,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Pokemon icons
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: pokemonIcons.map((iconPath) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              width: 40,
                              height: 40,
                              child: Image.network(
                                iconPath,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.catching_pokemon,
                                      color: Colors.white.withOpacity(0.7),
                                      size: 24,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
