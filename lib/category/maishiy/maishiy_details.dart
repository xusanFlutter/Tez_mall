import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/maishiy/maishiy.dart';
import 'package:tez_mall/category/maishiy/maishiy_pay.dart';
import 'package:tez_mall/category/televizor/televizors.dart';
import 'package:tez_mall/provider/add_to_cart.dart';

import 'maishiy_chat.dart';

// ignore: must_be_immutable
class MaishiysDetails extends StatefulWidget {
  Maishiys maishiy;
  MaishiysDetails({
    Key? key,
    required this.maishiy,
  }) : super(key: key);

  @override
  State<MaishiysDetails> createState() => _MaishiysDetailsState();
}

class _MaishiysDetailsState extends State<MaishiysDetails> {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Image.network(
              widget.maishiy.image,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                width: 150,
                height: 150,
                child: Center(
                  child: Text('Internet bilan muammo bor!'),
                ),
              ),
            ),
            Center(
              child: Text(
                widget.maishiy.name,
                style: const TextStyle(
                  fontSize: 27,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Mahsutor narxi: ',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  '\$${widget.maishiy.price}',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                SizedBox(width: 20),
                Text(
                  'Mahsulot haqida qishqacha',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                SizedBox(
                  width: 300,
                  child: Text(
                    widget.maishiy.description,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                SizedBox(width: 20),
                Text(
                  'Yetkazib berish',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                SizedBox(width: 20),
                FaIcon(
                  FontAwesomeIcons.truck,
                  color: Colors.green,
                ),
                Text(
                  ' O`zbekistonga yetkazib berish',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: CupertinoButton(
                color: CupertinoColors.systemRed,
                child: const Text('Xarid qilish'),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          MaishiysPay(maishiy: widget.maishiy),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: CupertinoButton(
                color: CupertinoColors.activeGreen,
                child: const Text('Fikir qoldirish'),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ChangeNotifierProvider.value(
                        value: counter,
                        child: MaishiysChat(maishiy: widget.maishiy),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: CupertinoButton(
                color: CupertinoColors.systemRed,
                child: const Text('Sevimlilarga qo`shish'),
                onPressed: () {
                  Provider.of<CounterModel>(context, listen: false).addCart(
                    Televizors(
                      name: widget.maishiy.name,
                      price: widget.maishiy.price,
                      description: widget.maishiy.description,
                      image: widget.maishiy.image,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 500),
                      content: const Text('Sevimlilarga qo`shildi'),
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Kommentlar:',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                scrollDirection: Axis.horizontal,
                // itemCount: addchat.length,
                itemCount:
                    counter.qushish3.isEmpty ? 1 : counter.qushish3.length,
                itemBuilder: (context, index) {
                  return counter.qushish3.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 300,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Text(
                                        counter.qushish3[index].name,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 10),
                                    const Text('Baho: '),
                                    Text(
                                      counter.qushish3[index].ball,
                                      style: const TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // ignore: avoid_unnecessary_containers
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      child: Text(
                                        counter.qushish3[index].title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Sana: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    counter.qushish3[index].time,
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      // ignore: avoid_unnecessary_containers
                      : Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: const [
                                  SizedBox(width: 20),
                                  SizedBox(
                                    width: 350,
                                    child: Text(
                                      'Xali bu mahsulotga mijozlar fikri yo`q',
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
