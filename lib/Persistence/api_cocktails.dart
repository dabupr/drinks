import 'package:cocktaildb/cocktaildb.dart';
import 'package:flutter/material.dart';

class ApiCocktails extends StatelessWidget {
  const ApiCocktails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<Cocktail> getRandomCocktail() async {
    var aux = await random();
    return aux;
  }

  Future<Cocktail> getCocktailId(int id) async {
    var aux = await searchById(id);
    return aux;
  }
}
