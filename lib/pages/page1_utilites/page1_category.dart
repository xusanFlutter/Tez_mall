import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/maishiy/maishiy.dart';
import 'package:tez_mall/category/noutbook/noutbook.dart';
import 'package:tez_mall/category/sport/sport.dart';
import 'package:tez_mall/category/telefon/telefon.dart';
import 'package:tez_mall/category/televizor/televizors.dart';
import 'package:tez_mall/provider/add_to_cart.dart';

class Page1Kategoriya extends StatefulWidget {
  const Page1Kategoriya({Key? key}) : super(key: key);

  @override
  State<Page1Kategoriya> createState() => _Page1KategoriyaState();
}

class _Page1KategoriyaState extends State<Page1Kategoriya> {
  @override
  Widget build(BuildContext context) {
    var _counter = Provider.of<CounterModel>(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                          value: _counter,
                          child: const Televizor(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 280,
                    height: 80,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(
                            'https://bq.ru/upload/iblock/b6a/front.jpg',
                            width: 70,
                            height: 70,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox(
                              width: 150,
                              height: 150,
                              child: Text('Internet bilan muammo bor!'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Televizor, foto, video',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                          value: _counter,
                          child: const Noutbook(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 280,
                    height: 80,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(
                            'https://gloimg.gbtcdn.com/gb/pdm-product-pic/Electronic/2017/09/25/source-img/20170925121833_25721.jpg',
                            width: 70,
                            height: 70,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox(
                              width: 150,
                              height: 150,
                              child: Text('Internet bilan muammo bor!'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Noutbook, kompyuterlar',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                          value: _counter,
                          child: const Telefon(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 280,
                    height: 80,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(
                            'https://xabar.uz/static/crop/2/0/920__95_2013014881.jpg',
                            width: 70,
                            height: 70,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox(
                              width: 150,
                              height: 150,
                              child: Text('Internet bilan muammo bor!'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: 190,
                            child: Text(
                              'Smartfon, telefon, gadget, aksesuarlar',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                          value: _counter,
                          child: const Maishiy(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 280,
                    height: 80,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(
                            'https://olcha.uz/image/360x360/products/aJeRp9TbZYMwVoMGIFWNHd6pZMC3HfTgwdA3HtxX8fFM6XudDP3mBEOeQ6S9.jpg',
                            width: 70,
                            height: 70,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox(
                              width: 150,
                              height: 150,
                              child: Text('Internet bilan muammo bor!'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Maishiy texnika',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                          value: _counter,
                          child: const Sport(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 280,
                    height: 80,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(
                            'https://seller.uz/uploads/categories/5fdffa3ea0bc7.png',
                            width: 70,
                            height: 70,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox(
                              width: 150,
                              height: 150,
                              child: Text('Internet bilan muammo bor!'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Sport anjomlari',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
