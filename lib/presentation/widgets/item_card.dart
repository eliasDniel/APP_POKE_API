import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/entities/pokemon.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.pokemon, required this.press});
  final Pokemon pokemon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 600,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 2, 51, 124),
              const Color.fromARGB(255, 30, 80, 150),
            ],
          ),
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Stack(
            children: [
              // Background pattern
              Positioned.fill(
                child: CustomPaint(painter: PokeBallPatternPainter()),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                // padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    // Left side - Text content
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pokemon.name.toUpperCase(),
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.5,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'N°${pokemon.id.toString().padLeft(3, '0')}',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: Hero(
                          tag: "${pokemon.id}",
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Image.network(
                              pokemon.sprites.frontShiny,
                              fit: BoxFit.cover,
                              height: 350,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 220,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.catching_pokemon,
                                    color: Colors.white54,
                                    size: 70,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
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

class PokeBallPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width * 0.85, size.height * 0.15);
    const radius = 40.0;

    canvas.drawCircle(center, radius, paint);
    canvas.drawLine(
      Offset(center.dx - radius, center.dy),
      Offset(center.dx + radius, center.dy),
      paint,
    );
    canvas.drawCircle(center, 8, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
