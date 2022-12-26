import 'package:cocktaildb/cocktaildb.dart';
import 'package:flutter/material.dart';
import 'package:drinks/Persistence/api_cocktails.dart';

class GetCardRandom extends StatefulWidget {
  GetCardRandom({super.key});

  @override
  State<GetCardRandom> createState() => _GetCardRandomState();
}

class _GetCardRandomState extends State<GetCardRandom> {
  final ApiCocktails drink = ApiCocktails();
  bool loaded = false;
  late Cocktail cocktail;

  @override
  void initState() {
    super.initState();

    loaded = false;
    loadData();
  }

  void loadData() async {
    cocktail = await drink.getRandomCocktail();
    setState(() {
      loaded = true;
    });
  }

  @override
  void didUpdateWidget(covariant GetCardRandom oldWidget) {
    //Aixo ho nessitem per saver si s'ha actualizat el widget :)
    super.didUpdateWidget(oldWidget);
    loaded = false;
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            loaded ? getImage() : const CircularProgressIndicator(),
            loaded ? allInfoText(context) : const CircularProgressIndicator(),
            IconButton(
              icon: const Icon(
                Icons.info_outline,
              ),
              iconSize: 36,
              splashRadius: 1,
              onPressed: () {
                moreInfo(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget getImage() {
    return Image.network(
      cocktail.strDrinkThumb.toString(),
      fit: BoxFit.fitWidth,
      //alignment: Alignment.bottomCenter,
    );
  }

  Widget allInfoText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: Colors.white,
            child: Text(
              cocktail.strDrink.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Container(
            color: Colors.white,
            child: Text(
              cocktail.strInstructions.toString(),
              //"ashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\nashdfjkh\n",
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.fade,

              maxLines: 7,
            ),
          ),
        ],
      ),
    );
  }

  void moreInfo(BuildContext context) {
    String ingredients = getIngredints();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Ingredients"),
          content: Text(ingredients),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String getDrinkId() {
    return cocktail.idDrink.toString();
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
