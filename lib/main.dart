import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemon_repository.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/features/pokedex/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
          repository: PokemonRepository(
              dio: Dio()
          )
      ),


      /*home: HomeContaianer(
        repository: PokemonRepository(dio: Dio()
        ),
      ),*/
    );
  }
}
