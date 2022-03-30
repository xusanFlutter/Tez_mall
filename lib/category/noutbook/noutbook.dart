import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/noutbook/noutbook_detail.dart';
import 'package:tez_mall/category/sport/sport.dart';
import 'package:tez_mall/category/televizor/televizors.dart';
import 'package:tez_mall/provider/add_to_cart.dart';
import 'package:tez_mall/shimmer/shimmer_effect.dart';

class Noutbooks {
  String name;
  String image;
  int price;
  String description;

  Noutbooks({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  void add(Noutbooks noutbooks) {}
}

class Noutbook extends StatefulWidget {
  const Noutbook({Key? key}) : super(key: key);

  @override
  State<Noutbook> createState() => _NoutbookState();
}

class _NoutbookState extends State<Noutbook> {
  List<Noutbooks> allNoutbooks = [
    Noutbooks(
      image:
          'https://www.apple.com/newsroom/images/product/mac/standard/Apple_new-macbookair-wallpaper-screen_11102020_big.jpg.large.jpg',
      name: 'Apple Mackbook Air M1',
      price: 1200,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Noutbooks(
      image:
          'https://www.ferra.ru/thumb/1200x0/filters:quality(75):no_upscale()/imgs/2021/10/30/11/4993811/1a3fb28cfb14b3d99fa846c98c4b96968041ec63.jpg',
      name: 'Mackbook Pro M1 Max',
      price: 1990,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Noutbooks(
      image:
          'https://assets.asaxiy.uz/product/items/desktop/f48e138e558268df31fe6c0c7135adf22022012710503949736ZSUxuOUVOm.png',
      name: 'HP 15-ef2126wm',
      price: 520,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Noutbooks(
      image: 'https://www.creditasia.uz/upload/iblock/0b6/mom6ohbbc9riy6jpo3h2jntika8tbqhx/noutbuk-lenovo-ideapad-3-15iml05-81wb003grk.jpg',
      name: 'Lenovo noutbooki office',
      price: 340,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Noutbooks(
      image:
          'https://notebookoff.uz/image/cache/catalog/catalog2/asus%20g513qm%201-800x800.jpg',
      name: 'Asus Rog Strix',
      price: 2300,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Noutbooks(
      image:
          'https://images.anandtech.com/doci/6931/Acer%20Aspire%20P3%20notebook%20mode_678x452.jpg',
      name: 'Acer Biznes Ultrabooki',
      price: 1100,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
  ];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1), () {});
    allNoutbooks = List.of(allNoutbooks);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _counter = Provider.of<CounterModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Noutbooklar',
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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: loadData,
          child: ListView(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 700,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: isLoading ? 6 : allNoutbooks.length,
                  itemBuilder: (context, index) {
                    if (isLoading) {
                      return buildFoodShimmer();
                    }
                    final noutbook = allNoutbooks[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ChangeNotifierProvider.value(
                              value: _counter,
                              child: NoutbooksDetails(
                                noutbook: noutbook,
                              ),
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 130,
                                height: 130,
                                child: Image.network(
                                  noutbook.image,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      const SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Text(
                                        'Internet bilan muammo bor!'),
                                  ),
                                ),
                              ),
                              Text(
                                noutbook.name,
                              ),
                              Text('\$${noutbook.price}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFoodShimmer() {
    // ignore: avoid_unnecessary_containers
    return Row(
      children: [
        // ignore: avoid_unnecessary_containers
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ShimmerWidget.circular(
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 150,
              width: 150,
            ),
          ),
        ),
      ],
    );
  }
}



