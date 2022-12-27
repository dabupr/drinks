import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SaveLocal extends StatelessWidget {
  const SaveLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<List<String>> getLikedIds() async {
    var box = await Hive.openBox('likedBoxTEST');
    List<String> likedListId = [];
    for (int aux = 0; box.length > aux; aux++) {
      if (box.getAt(aux) != "" && box.getAt(aux) != null) {
        likedListId.add(box.getAt(aux));
      }
    }
    return likedListId;
  }

  void adLikedId(String id) async {
    var box = await Hive.openBox('likedBoxTEST');
    if (await checkThatNotExist(id)) {
      box.add(id);
    }
  }

  void removeLikedId(String id) async {
    var box = await Hive.openBox('likedBoxTEST');
    for (int aux = 0; box.length > aux; aux++) {
      if (id == box.getAt(aux)) {
        box.deleteAt(aux);
      }
    }
  }

  Future<bool> checkThatNotExist(String id) async {
    var box = await Hive.openBox('likedBoxTEST');
    for (int aux = 0; box.length > aux; aux++) {
      if (id == box.getAt(aux)) {
        return false;
      }
    }
    return true;
  }

  //---------------------------------------------
  Future<List<String>> getDISLikedIds() async {
    var box = await Hive.openBox('DISlikedBoxTEST');
    List<String> likedListId = [];
    for (int aux = 0; box.length > aux; aux++) {
      likedListId.add(box.getAt(aux));
    }
    return likedListId;
  }

  void adDISLikedId(String id) async {
    var box = await Hive.openBox('DISlikedBoxTEST');
    if (await checkThatNotExistDISLIKED(id)) {
      box.add(id);
    }
  }

  void removeDISLikedId(String id) async {
    var box = await Hive.openBox('DISlikedBoxTEST');
    for (int aux = 0; box.length > aux; aux++) {
      if (id == box.getAt(aux)) {
        if (box.getAt(aux) != "" && box.getAt(aux) != null) {
          box.deleteAt(aux);
        }
      }
    }
  }

  Future<bool> checkThatNotExistDISLIKED(String id) async {
    var box = await Hive.openBox('DISlikedBoxTEST');
    for (int aux = 0; box.length > aux; aux++) {
      if (id == box.getAt(aux)) {
        return false;
      }
    }
    return true;
  }
}
