import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBarWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          DetailListWiget(
            pokemon: pokemon,
            list: list,
            controller: controller,
            onChangePokemon: onChangePokemon,
          )
        ],
      ),
    );
  }
}
