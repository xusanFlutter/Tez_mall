import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/sport/sport.dart';
import 'package:tez_mall/provider/add_to_cart.dart';


var star1 = Colors.black;
var star2 = Colors.black;
var star3 = Colors.black;
var star4 = Colors.black;
var star5 = Colors.black;
var sariq = Colors.yellow;
var ball = 0;
var time = '';
bool check = false;
bool check2 = false;

TextEditingController name = TextEditingController();
TextEditingController number = TextEditingController();
TextEditingController mmgg = TextEditingController();
TextEditingController password = TextEditingController();

// ignore: must_be_immutable


class AddChat3 {
  final String name;
  final dynamic time;
  final String ball;
  final String title;

  AddChat3({
    required this.name,
    required this.time,
    required this.ball,
    required this.title,
  });
}

// ignore: must_be_immutable
class SportsChat extends StatefulWidget {
  Sports sports;

  SportsChat({Key? key, required this.sports}) : super(key: key);

  @override
  State<SportsChat> createState() => _SportsChatState();
}

class _SportsChatState extends State<SportsChat> {
  TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Fikir qolidirish',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.network(
                  widget.sports.image,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const Text('Internet bilan muammo bor!'),
                ),
              ),
              Text(
                widget.sports.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: Divider(
              height: 2,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: const [
              SizedBox(width: 20),
              Text(
                'Mahsulotni baxolang',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  setState(() {
                    star1 = sariq;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: star1,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    star2 = sariq;
                    star1 = sariq;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: star2,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    star3 = sariq;
                    star2 = sariq;
                    star1 = sariq;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: star3,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    star4 = sariq;
                    star3 = sariq;
                    star2 = sariq;
                    star1 = sariq;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: star4,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    star5 = sariq;
                    star4 = sariq;
                    star3 = sariq;
                    star2 = sariq;
                    star1 = sariq;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: star5,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              maxLines: 5,
              keyboardType: TextInputType.name,
              controller: chatController,
              decoration: const InputDecoration(
                hintText: 'Mahusulot haqida fikringiz',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: CupertinoButton(
              color: CupertinoColors.systemRed,
              child: const Text('Fikir qoldirish'),
              onPressed: () {
                if (star1 == sariq) {
                  ball = 1;
                }
                if (star2 == sariq) {
                  ball = 2;
                }
                if (star3 == sariq) {
                  ball = 3;
                }
                if (star4 == sariq) {
                  ball = 4;
                }
                if (star5 == sariq) {
                  ball = 5;
                }
                if (chatController.text != '') {
                  setState(
                    () {
                      star5 = Colors.black;
                      star4 = Colors.black;
                      star3 = Colors.black;
                      star2 = Colors.black;
                      star1 = Colors.black;
                      count.addChat3(
                        AddChat3(
                          name: count.name,
                          time: Text(time = DateTime.now().toString()),
                          ball: ball.toString(),
                          title: chatController.text,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Fikir qoldirildi'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  );

                  chatController.text = "";
                } else {
                  return;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
