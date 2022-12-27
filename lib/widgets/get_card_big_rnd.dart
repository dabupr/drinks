import 'package:cocktaildb/cocktaildb.dart';
import 'package:flutter/material.dart';
import 'package:drinks/Persistence/api_cocktails.dart';

import '../view_cocktail.dart';

class GetCardRandom extends StatefulWidget {
  GetCardRandom({super.key});
  String saveCocktailID = ""; //Utlitzem aixo per saver quin es la veguda que es mostre per pantalla

  @override
  State<GetCardRandom> createState() => _GetCardRandomState();
}

class _GetCardRandomState extends State<GetCardRandom> {
  final ApiCocktails drink = ApiCocktails();
  bool loaded = false;
  late Cocktail cocktail;
  late Image imgCocktail;

  @override
  void initState() {
    super.initState();
    loaded = false;
    loadData();
  }

  void loadData() async {
    cocktail = await drink.getRandomCocktail();
    setState(() {
      widget.saveCocktailID = cocktail.idDrink.toString();
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
        child: GestureDetector(
          child: Stack(
            children: [
              loaded ? getImage() : const CircularProgressIndicator(),
              loaded ? allInfoText(context) : const CircularProgressIndicator(),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewAllInfo(cocktail: cocktail, img: imgCocktail)),
            );
          },
        ),
      ),
    );
  }

  Widget getImage() {
    imgCocktail = Image.network(
      cocktail.strDrinkThumb.toString(),
      fit: BoxFit.fitWidth,
    );
    return Hero(
      tag: "foto",
      child: imgCocktail,
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
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.fade,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
