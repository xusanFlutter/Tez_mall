import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/maishiy/maishiy.dart';
import 'package:tez_mall/category/noutbook/noutbook.dart';
import 'package:tez_mall/category/telefon/telefon.dart';
import 'package:tez_mall/category/televizor/televizors.dart';
import 'package:tez_mall/provider/add_to_cart.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    var _counter = Provider.of<CounterModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Katalog',
          style: TextStyle(fontSize: 27, color: Colors.black),
        ),
      ),
      body: ListView(
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
                  width: 170,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[250],
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        'https://bq.ru/upload/iblock/b6a/front.jpg',
                        width: 150,
                        height: 150,
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
                      const Text(
                        'Televizor, foto, video',
                        style: TextStyle(
                          fontSize: 20,
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
                  width: 170,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[250],
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        'https://gloimg.gbtcdn.com/gb/pdm-product-pic/Electronic/2017/09/25/source-img/20170925121833_25721.jpg',
                        width: 150,
                        height: 150,
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
                      const Text(
                        'Noutbook, kompyuterlar',
                        style: TextStyle(
                          fontSize: 20,
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
                        child: const Telefon(),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[250],
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        'https://xabar.uz/static/crop/2/0/920__95_2013014881.jpg',
                        width: 150,
                        height: 150,
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
                      const Text(
                        'Smartfon, telefon, gadgetlar.',
                        style: TextStyle(
                          fontSize: 20,
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
                        child: const Maishiy(),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[250],
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        'https://olcha.uz/image/360x360/products/aJeRp9TbZYMwVoMGIFWNHd6pZMC3HfTgwdA3HtxX8fFM6XudDP3mBEOeQ6S9.jpg',
                        width: 150,
                        height: 150,
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
                      const Text(
                        'Maishiy texnikas',
                        style: TextStyle(
                          fontSize: 20,
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
    );
  }
}
