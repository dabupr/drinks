import 'package:animated_icon/animate_icon.dart';
import 'package:animated_icon/animate_icons.dart';
import 'package:drinks/Persistence/save_local.dart';
import 'package:drinks/widgets/get_card_big_rnd.dart';
import 'package:drinks/widgets/side_bar.dart';
import 'package:drinks/widgets/top_bar.dart';
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
  late GetCardRandom actualDrinkInfo;
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
        //TopBar(scaffoldKey: _scaffoldKey),
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
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.black.withOpacity(0.1),
          ),
          child: AnimateIcon(
            key: UniqueKey(),
            onTap: () {
              controllerSwipe.swipeLeft();
              const SaveLocal().adDISLikedId(actualDrinkInfo.saveCocktailID);
            },
            iconType: IconType.continueAnimation,
            height: 70,
            width: 70,
            color: Colors.red,
            animateIcon: AnimateIcons.cross,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.black.withOpacity(0.1),
          ),
          child: AnimateIcon(
            key: UniqueKey(),
            onTap: () {
              controllerSwipe.swipeRight();
              const SaveLocal().adLikedId(actualDrinkInfo.saveCocktailID);
            },
            iconType: IconType.continueAnimation,
            height: 70,
            width: 70,
            color: Colors.green,
            animateIcon: AnimateIcons.heart,
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
              child: Text("COCKTAILMATCH", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
      actualDrinkInfo = GetCardRandom();
      cards.add(actualDrinkInfo);
    });
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
        isDisabled: false,
      ),
    );
  }
}
