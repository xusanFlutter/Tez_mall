import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/sport/sport.dart';
import 'package:tez_mall/category/televizor/televizors.dart';
import 'package:tez_mall/provider/add_to_cart.dart';
import 'package:tez_mall/shimmer/shimmer_effect.dart';

import 'maishiy_details.dart';

class Maishiys {
  String name;
  String image;
  int price;
  String description;

  Maishiys({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  void add(Maishiys maishiys) {}
}

class Maishiy extends StatefulWidget {
  const Maishiy({Key? key}) : super(key: key);

  @override
  State<Maishiy> createState() => _MaishiyState();
}

class _MaishiyState extends State<Maishiy> {
  List<Maishiys> allMaishiys = [
    Maishiys(
      image:
          'https://apollo-olx.cdnvideo.ru/v1/files/rn9kzmrw6pqr3-UZ/image;s=550x701',
      name: 'Sifatli chang yutgich',
      price: 200,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Maishiys(
      image:
          'https://salexy.uz/images/img_uz/474x354/87/25/8725ff0061f68054d217dd39eb22dab7.jpg',
      name: 'Arzon mirko to`lqinli pech',
      price: 190,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Maishiys(
      image:
          'https://files.glotr.uz/company/000/003/263/products/2020/04/19/2020-04-19-11-03-02-096071-2dfc884f72a309d870fe0c5d6ab907d2.jpg?_=ozbol',
      name: 'Samsung blenderi',
      price: 220,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Maishiys(
      image:
          'https://tezz.uz/uploads/images/product/553/thumbs/202255_3-10501050.jpg',
      name: 'Artel konditsioneri',
      price: 340,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Maishiys(
      image: 'https://yukber.uz/image/cache/catalog/14hq-700x700.jpg',
      name: 'Samsung muzlatgichi',
      price: 520,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Maishiys(
      image:
          'https://assets.asaxiy.uz/product/items/desktop/c81e728d9d4c2f636f067f89cc14862c2020051210533058335yZD9WWWgQx.jpg',
      name: 'Xiaomi gaz plitasi',
      price: 480,
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
    allMaishiys = List.of(allMaishiys);

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
          'Maishiy texnikalar',
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
                  itemCount: isLoading ? 6 : allMaishiys.length,
                  itemBuilder: (context, index) {
                    if (isLoading) {
                      return buildFoodShimmer();
                    }
                    final maishiy = allMaishiys[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ChangeNotifierProvider.value(
                              value: _counter,
                              child: MaishiysDetails(
                                maishiy: maishiy,
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
                                  maishiy.image,
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
                                        child: Center(
                                    child: Text('Internet bilan muammo bor!'),
                                  ),
                                      ),
                                ),
                              ),
                              Text(
                                maishiy.name,
                              ),
                              Text('\$${maishiy.price}'),
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


