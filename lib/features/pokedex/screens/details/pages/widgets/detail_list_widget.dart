import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailListWiget extends StatelessWidget {
  const DetailListWiget({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      height: 350,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) => onChangePokemon(list[index]),
                controller: controller,
                children: list.map(
                  (e) {
                    bool diff = e.name != pokemon.name;
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: diff ? 0.4 : 1.0,
                      child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          tween: Tween<double>(
                              begin: diff ? 300 : 100,
                              end: diff ? 100 : 300),
                          builder: (context, value, child) {
                            return Center(
                              child: Image.network(
                                e.image,
                                fit: BoxFit.contain,
                                width: value,
                                color: diff
                                    ? Colors.black.withOpacity(0.4)
                                    : null,
                              ),
                            );
                          }),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
