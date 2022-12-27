import 'package:cocktaildb/cocktaildb.dart';
import 'package:flutter/material.dart';

class ViewAllInfo extends StatelessWidget {
  final Cocktail cocktail;
  final Image img;
  const ViewAllInfo({super.key, required this.cocktail, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        Hero(tag: "foto", child: img),
        Flexible(flex: 10, child: SingleChildScrollView(child: allTheText())),
      ],
    );
  }

  Widget allTheText() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          cocktail.strDrink.toString(),
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: getInfo(),
        ),
        const SizedBox(height: 10),
        Text(getIngredints()),
      ],
    );
  }

  Widget getInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 10),
        Text(
          cocktail.strInstructions.toString(),
          style: const TextStyle(fontSize: 18),
          overflow: TextOverflow.fade,
          //maxLines: 10,
        ),
      ],
    );
  }

  String getIngredints() {
    String ingredients = "";
    if (cocktail.strIngredient1 != null && cocktail.strMeasure1 != null) {
      ingredients = "$ingredients${cocktail.strMeasure1} ${cocktail.strIngredient1} \n";
    }
    if (cocktail.strIngredient2 != null && cocktail.strMeasure2 != null) {
      ingredients = "$ingredients${cocktail.strMeasure2} ${cocktail.strIngredient2} \n";
    }
    if (cocktail.strIngredient3 != null && cocktail.strMeasure3 != null) {
      ingredients = "$ingredients${cocktail.strMeasure3} ${cocktail.strIngredient3} \n";
    }
    if (cocktail.strIngredient4 != null && cocktail.strMeasure4 != null) {
      ingredients = "$ingredients${cocktail.strMeasure4} ${cocktail.strIngredient4} \n";
    }
    if (cocktail.strIngredient5 != null && cocktail.strMeasure5 != null) {
      ingredients = "$ingredients${cocktail.strMeasure5} ${cocktail.strIngredient5} \n";
    }
    if (cocktail.strIngredient6 != null && cocktail.strMeasure6 != null) {
      ingredients = "$ingredients${cocktail.strMeasure6} ${cocktail.strIngredient6} \n";
    }
    if (cocktail.strIngredient7 != null && cocktail.strMeasure7 != null) {
      ingredients = "$ingredients${cocktail.strMeasure7} ${cocktail.strIngredient7} \n";
    }
    if (cocktail.strIngredient8 != null && cocktail.strMeasure8 != null) {
      ingredients = "$ingredients${cocktail.strMeasure8} ${cocktail.strIngredient8} \n";
    }
    if (cocktail.strIngredient9 != null && cocktail.strMeasure9 != null) {
      ingredients = "$ingredients${cocktail.strMeasure9} ${cocktail.strIngredient9} \n";
    }
    if (cocktail.strIngredient10 != null && cocktail.strMeasure10 != null) {
      ingredients = "$ingredients${cocktail.strMeasure10} ${cocktail.strIngredient10} \n";
    }
    return ingredients;
  }
}
