import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/sport/sport.dart';
import 'package:tez_mall/category/sport/sport_chat.dart';
import 'package:tez_mall/category/televizor/televizors.dart';
import 'package:tez_mall/provider/add_to_cart.dart';

class QiziqarliList {
  String name;
  String image;
  int price;
  String description;

  QiziqarliList({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  void add(QiziqarliList qiziqarli) {}
}

class Qiziqarli extends StatefulWidget {
  const Qiziqarli({Key? key}) : super(key: key);

  @override
  State<Qiziqarli> createState() => _Qiziqarlitate();
}

class _Qiziqarlitate extends State<Qiziqarli> {
  List<QiziqarliList> allQiziqarli = [
    QiziqarliList(
      image:
          'https://www.apple.com/newsroom/images/product/mac/standard/Apple_new-macbookair-wallpaper-screen_11102020_big.jpg.large.jpg',
      name: 'Apple Mackbook Air M1',
      price: 1200,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    QiziqarliList(
      image:
          'https://www.ferra.ru/thumb/1200x0/filters:quality(75):no_upscale()/imgs/2021/10/30/11/4993811/1a3fb28cfb14b3d99fa846c98c4b96968041ec63.jpg',
      name: 'Mackbook Pro M1 Max',
      price: 1990,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    QiziqarliList(
      image:
          'https://assets.asaxiy.uz/product/items/desktop/f48e138e558268df31fe6c0c7135adf22022012710503949736ZSUxuOUVOm.png',
      name: 'HP 15-ef2126wm Qiziqarlii',
      price: 520,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    QiziqarliList(
      image:
          'https://www.creditasia.uz/upload/iblock/0b6/mom6ohbbc9riy6jpo3h2jntika8tbqhx/noutbuk-lenovo-ideapad-3-15iml05-81wb003grk.jpg',
      name: 'Lenovo Qiziqarlii office',
      price: 340,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    QiziqarliList(
      image:
          'https://notebookoff.uz/image/cache/catalog/catalog2/asus%20g513qm%201-800x800.jpg',
      name: 'Asus Rog Strix',
      price: 2300,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    QiziqarliList(
      image:
          'https://images.anandtech.com/doci/6931/Acer%20Aspire%20P3%20notebook%20mode_678x452.jpg',
      name: 'Acer Biznes Ultrabooki',
      price: 1100,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    QiziqarliList(
      image:
          'https://assets.asaxiy.uz/product/items/desktop/c81e728d9d4c2f636f067f89cc14862c2020051210533058335yZD9WWWgQx.jpg',
      name: 'Xiaomi Gaz plitasi',
      price: 480,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    QiziqarliList(
      image:
          'https://yukber.uz/image/cache/catalog/14hq-700x700.jpg',
      name: 'Samsung muzlatgichi',
      price: 520,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var _counter = Provider.of<CounterModel>(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: allQiziqarli.length,
      itemBuilder: (context, index) {
        final qiziqarli = allQiziqarli[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ChangeNotifierProvider.value(
                    value: _counter,
                    child: QiziqarliDetails(
                      qiziqarli: qiziqarli,
                    ),
                  ),
                ),
              );
            },
            child: Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Image.network(
                    allQiziqarli[index].image,
                    width: 130,
                    height: 130,
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
                  Text(allQiziqarli[index].name),
                  Text('\$${allQiziqarli[index].price}'.toString()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class QiziqarliDetails extends StatefulWidget {
  QiziqarliList qiziqarli;
  QiziqarliDetails({
    Key? key,
    required this.qiziqarli,
  }) : super(key: key);

  @override
  State<QiziqarliDetails> createState() => _QiziqarliDetailsState();
}

class _QiziqarliDetailsState extends State<QiziqarliDetails> {
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
              widget.qiziqarli.image,
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
                child: Text('Internet bilan muammo bor!'),
              ),
            ),
            Center(
              child: Text(
                widget.qiziqarli.name,
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
                  '\$${widget.qiziqarli.price}',
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
                    widget.qiziqarli.description,
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
                          QiziqarliPay(qiziqarli: widget.qiziqarli),
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
                        child: QiziqarliChat(qiziqarli: widget.qiziqarli),
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
                      name: widget.qiziqarli.name,
                      price: widget.qiziqarli.price,
                      description: widget.qiziqarli.description,
                      image: widget.qiziqarli.image,
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
class QiziqarliPay extends StatefulWidget {
  QiziqarliList qiziqarli;
  QiziqarliPay({Key? key, required this.qiziqarli}) : super(key: key);

  @override
  State<QiziqarliPay> createState() => _QiziqarliPayState();
}

class _QiziqarliPayState extends State<QiziqarliPay> {
  void progressAlert(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black54,
      barrierLabel: 'Label',
      barrierDismissible: false,
      pageBuilder: (_, __, ___) => Center(
        child: Container(
          color: Colors.transparent,
          child: Material(
            color: Colors.transparent,
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 40,
              height: 40,
              child: const Center(
                child: CircularProgressIndicator(
                  // color: Color(0xFF88B3F3),
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> alertPop() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        // Navigator.canPop(context);
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Muoffiqayatli'),
            content: const Text('To`lov muoffiqiyatli yakulandi !'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        );
        name.text = '';
        number.text = '';
        mmgg.text = '';
        password.text = '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Mahsulotni xarid qilish',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
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
                  widget.qiziqarli.image,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Text('Internet bilan muammo bor!')),
                ),
              ),
              Column(
                children: [
                  Text(
                    widget.qiziqarli.name,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$${widget.qiziqarli.price}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(width: 40),
              SizedBox(
                width: 350,
                child: Text(
                  'To`lovlarni faqat VISA kartasi bilan amalga oshirishingiz mumkin.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: TextFormField(
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Kartadagi ism',
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: TextFormField(
                  controller: number,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Karta raqami',
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 45, left: 45),
                child: TextFormField(
                  controller: mmgg,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'MM/ГГ',
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 45, left: 45),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Karta xafsizlik kodi',
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
                  color: Colors.red,
                  child: const Text('To`lov qilish'),
                  onPressed: () {
                    if (name.text.isNotEmpty ||
                        number.text.isNotEmpty ||
                        mmgg.text.isNotEmpty ||
                        password.text.isNotEmpty) {
                      progressAlert(context);
                      alertPop();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Xatolik'),
                          content: const Text(
                              'Qatorlarni tekshirib qayta urinib ko`ring !'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class QiziqarliChat extends StatefulWidget {
  QiziqarliList qiziqarli;

  QiziqarliChat({Key? key, required this.qiziqarli}) : super(key: key);

  @override
  State<QiziqarliChat> createState() => _QiziqarliChatState();
}

class _QiziqarliChatState extends State<QiziqarliChat> {
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
                  widget.qiziqarli.image,
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
                widget.qiziqarli.name,
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
