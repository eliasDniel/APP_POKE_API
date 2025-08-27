import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_poke_api/config/router/app_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

=======
import 'package:flutter_poke_api/presentation/screens/home_screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> dda8d96e577d2b9ab33ca7e8745f090f15b63939

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
=======
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreens(),
>>>>>>> dda8d96e577d2b9ab33ca7e8745f090f15b63939
    );
  }
}


