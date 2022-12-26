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
        color: Colors.white.withOpacity(0.95),
        child: Stack(
          children: [
            loaded ? getImage() : const CircularProgressIndicator(),
            loaded ? allInfoText() : const CircularProgressIndicator(),
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
    );
  }

  Widget allInfoText() {
    print(cocktail.strDrink.toString());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            cocktail.strDrink.toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            cocktail.strInstructions.toString(),
            style: TextStyle(fontSize: 12),
          ),
          //Text("Name of the", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  void moreInfo(BuildContext context) {
    getIngredint(5);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Ingredients"),
          content: Text("You are awesome!"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void getIngredint(int num) {
    if (cocktail.strIngredient1 != null && cocktail.strIngredient1 != null ) {
      
    }
    
  }
}
