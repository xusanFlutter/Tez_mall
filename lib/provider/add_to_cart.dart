import 'package:flutter/material.dart';
import 'package:tez_mall/category/sport/sport_chat.dart';
import 'package:tez_mall/category/telefon/telefon.dart';
import 'package:tez_mall/category/televizor/televizors.dart';

 var time = '';

class CounterModel extends ChangeNotifier {
  String name = '';
  String email = '';
  String phone = '';

  List<Televizors> cartkList = [];
  List<Telefons> cartList2 = [];
  List<AddChat2> qushish2 = [];
  List<AddChat3> qushish3 = [];
  List<AddChat> qushish = [
    AddChat(
      name: 'Hasan',
      time: Text(time = '2.03.2022'),
      ball: '3',
      title:
          'Mahsulotlar yaxshi nu lekin yetkazib berish xizmati unchalik xam emas.',
    ),
    AddChat(
      name: 'Jaloliddin',
      time:  Text(time = '12.03.2022'),
      ball: '5',
      title: 'Juda xam a`lo.',
    ),
  ];
  void addCart(Televizors tex) {
    cartkList.add(tex);
    // ignore: unused_local_variable
    notifyListeners();
  }

  void removeList(int item) {
    cartkList.removeAt(item);
    notifyListeners();
  }

  void addChat(AddChat addChat) {
    qushish.add(addChat);
    notifyListeners();
  }

  void addChat2(AddChat2 addChat) {
    qushish2.add(addChat);
    notifyListeners();
  }

  void addChat3(AddChat3 addChat) {
    qushish3.add(addChat);
    notifyListeners();
  }

  void controllerData(controllerName, controllerEmail, controllerPhone) {
    name = controllerName;
    email = controllerEmail;
    phone = controllerPhone;
    notifyListeners();
  }
}
