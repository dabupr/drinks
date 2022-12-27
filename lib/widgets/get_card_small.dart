import 'package:cocktaildb/cocktaildb.dart';
import 'package:drinks/Persistence/save_local.dart';
import 'package:drinks/likes_dislikes.dart';
import 'package:flutter/material.dart';
import 'package:drinks/Persistence/api_cocktails.dart';

class GetCardSmall extends StatefulWidget {
  final String idCocktail;
  final bool likeMode;
  const GetCardSmall({
    super.key,
    required this.idCocktail,
    required this.likeMode,
  });

  @override
  State<GetCardSmall> createState() => _GetCardSmall();
}

class _GetCardSmall extends State<GetCardSmall> {
  final ApiCocktails drink = const ApiCocktails();
  bool loaded = false;
  late Cocktail cocktail;

  @override
  void initState() {
    super.initState();
    loaded = false;
    loadData();
  }

  void loadData() async {
    cocktail = await drink.getCocktailId(int.parse(widget.idCocktail));
    setState(() {
      loaded = true;
    });
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
                Icons.save,
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
        ],
      ),
    );
  }

  void moreInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Remove?"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Remove"),
              onPressed: () {
                Navigator.of(context).pop();
                if (widget.likeMode) {
                  const SaveLocal().removeLikedId(cocktail.idDrink.toString());
                } else {
                  const SaveLocal().removeDISLikedId(cocktail.idDrink.toString());
                }
              },
            ),
            ElevatedButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
