import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/sport/sport_details.dart';
import 'package:tez_mall/category/televizor/televizors.dart';
import 'package:tez_mall/provider/add_to_cart.dart';
import 'package:tez_mall/shimmer/shimmer_effect.dart';

class Sports {
  String name;
  String image;
  int price;
  String description;

  Sports({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  void add(Sports sports) {}
}

class Sport extends StatefulWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  State<Sport> createState() => _SportState();
}

class _SportState extends State<Sport> {
  List<Sports> allSports = [
    Sports(
      image:
          'https://assets.asaxiy.uz/product/items/desktop/3af2d82b3930cc312a226d2a7e6b04a52020091811160346318BrglyDkuzM.jpg',
      name: 'Yugurish yo`lakchasi',
      price: 420,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Sports(
      image:
          'https://apollo-olx.cdnvideo.ru/v1/files/5n9nm2zo4vpv3-UZ/image;s=644x461',
      name: 'Tennis stoli',
      price: 120,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Sports(
      image:
          'https://techno.uz/image/cache/catalog/Veloxizmat%2026%20green-700x500.jpg',
      name: 'Sport velosipedi',
      price: 599,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Sports(
      image: 'https://dauscher.kz/d/34_0.png',
      name: 'Samokat bolalar uchun',
      price: 140,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Sports(
      image:
          'https://football-shop.ru/wp-content/uploads/2021/06/PSG-Home-Kids-Football-Kit-21-22.jpg',
      name: 'PSG clubi formasi',
      price: 32,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Sports(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3x4yQV679hGFmtz_w5rKGddsCfE6HhJVFNg&usqp=CAU',
      name: 'Koptoklar to`plami',
      price: 45,
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
    allSports = List.of(allSports);

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
          'Sport anjomlari',
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
                  itemCount: isLoading ? 6 : allSports.length,
                  itemBuilder: (context, index) {
                    if (isLoading) {
                      return buildFoodShimmer();
                    }
                    final sport = allSports[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ChangeNotifierProvider.value(
                              value: _counter,
                              child: SportsDetails(
                                sports: sport,
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
                                  sport.image,
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
                                sport.name,
                              ),
                              Text('\$${sport.price}'),
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

