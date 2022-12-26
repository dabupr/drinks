import 'package:drinks/widgets/get_card.dart';
import 'package:drinks/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppinioSwiperController controllerSwipe = AppinioSwiperController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //Aquesta linea es de internet, Per que el boto funcioni
  List<Widget> cards = [];

  //GetCardRandom getCardFromAPI = GetCardRandom();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: getBody(context),
      endDrawer: const SideBar(),
    );
  }

  @override
  void initState() {
    super.initState();
    loadCard();
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 10),
        topBar(),
        const Spacer(flex: 5),
        imagesSwipe(context),
        const Spacer(flex: 5),
        likeDislikeButtons(),
        const Spacer(flex: 5),
      ],
    );
  }

  Widget likeDislikeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: Colors.white.withOpacity(0.8),
          ),
          child: IconButton(
            onPressed: () {
              controllerSwipe.swipeLeft();
            },
            icon: const Icon(Icons.thumb_down, color: Colors.red),
            iconSize: 60,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: Colors.white.withOpacity(0.8),
          ),
          child: IconButton(
            onPressed: () {
              controllerSwipe.swipeRight();
            },
            icon: const Icon(Icons.favorite, color: Colors.green),
            iconSize: 60,
          ),
        ),
      ],
    );
  }

  Widget topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: Colors.white.withOpacity(0.8),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("COCKTAILMATCH",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            )),
        const Divider(),
        GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.white.withOpacity(0.8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.menu,
                  size: 40,
                ),
              )),
          onTap: () {
            _scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ],
    );
  }

  loadCard() {
    //Nose per que aqui no vol que sigui void
    setState(() {
      cards.add(GetCardRandom());
      cards.add(GetCardRandom());
      cards.add(GetCardRandom());
      cards.add(GetCardRandom());
    });
  }

  addNewcard() {
    cards.add(GetCardRandom());
  }

  Widget imagesSwipe(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width * 0.8,
      child: AppinioSwiper(
        controller: controllerSwipe,
        cards: cards,
        onEnd: loadCard,
        //onSwipe: addNewcard,
        isDisabled: true,
      ),
    );
  }
}
