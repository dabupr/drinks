import 'package:drinks/Persistence/save_local.dart';
import 'package:drinks/widgets/get_card_small.dart';
import 'package:flutter/material.dart';

class LikeDislike extends StatelessWidget {
  bool liked;
  LikeDislike({super.key, required this.liked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, centerTitle: true, title: liked ? const Text("Likes") : const Text("Dislikes")),
      body: FutureBuilder(
        //S'hade fer servir un futurebuilder ja que el getbody es async
        future: getBody(), //This will be called evry time is rebuild
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            return snapshot.data;
          }
        },
      ),
    );
  }

  Future<Widget> getBody() async {
    var aux = await llistaDrinks();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          //Hem de fer servir el builder per que si no hes dinamic
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 8),
          itemCount: aux.length,
          itemBuilder: (BuildContext context, int index) {
            return GetCardSmall(idCocktail: aux[index], likeMode: liked);
          }),
    );
  }

  Future<List<String>> llistaDrinks() async {
    if (liked) {
      return await SaveLocal().getLikedIds();
    } else {
      return await SaveLocal().getDISLikedIds();
    }
  }
}
