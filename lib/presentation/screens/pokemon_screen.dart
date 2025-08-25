import 'package:flutter/material.dart';
import 'package:flutter_poke_api/domain/domain.dart';

import '../../config/config.dart';
import '../widgets/color_and_size.dart';
import '../widgets/description.dart';
import '../widgets/pokemon_title_image.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      backgroundColor: const Color(0xFF3D82AE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D82AE),
        elevation: 0,
        // leading: IconButton(
        //   icon: SvgPicture.asset(
        //     'assets/icons/back.svg',
        //     colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        //   ),
        //   onPressed: () => Navigator.pop(context),
        // ),
        actions: <Widget>[
          // IconButton(
          //   icon: SvgPicture.asset("assets/icons/search.svg"),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: SvgPicture.asset("assets/icons/cart.svg"),
          //   onPressed: () {},
          // ),
          // const SizedBox(width: kDefaultPaddin / 2)
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
                      children: <Widget>[
                        ColorAndSize(pokemon: pokemon),
                        const SizedBox(height: kDefaultPaddin / 2),
                        Description(pokemon: pokemon),
                        const SizedBox(height: kDefaultPaddin / 2),
                        // const CounterWithFavBtn(),
                        const SizedBox(height: kDefaultPaddin / 2),
                        // AddToCart(product: pokemon)
                      ],
                    ),
                  ),
                  ProductTitleWithImage(pokemon: pokemon)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
