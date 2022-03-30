import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/televizor/televizor_details.dart';
import 'package:tez_mall/provider/add_to_cart.dart';
import 'package:tez_mall/shimmer/shimmer_effect.dart';

class Televizors {
  String name;
  String image;
  int price;
  String description;

  Televizors({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  void add(Televizors televizors) {}
}

class AddChat {
  final String name;
  final dynamic time;
  final String ball;
  final String title;

  AddChat({
    required this.name,
    required this.time,
    required this.ball,
    required this.title,
  });
}

class Televizor extends StatefulWidget {
  const Televizor({Key? key}) : super(key: key);

  @override
  State<Televizor> createState() => _TelevizorState();
}

class _TelevizorState extends State<Televizor> {
  List<Televizors> allTelevizor = [
    Televizors(
      image:
          'https://apollo-olx.cdnvideo.ru/v1/files/v11cd59y4ak8-UZ/image;s=1080x800',
      name: 'Samsung QLED televizori',
      price: 515,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Televizors(
      image:
          'https://images.samsung.com/is/image/samsung/p6pim/uz_ru/qe85qn800auxce/gallery/uz-ru-neo-qled-8k-qn800a-qe85qn800auxce-456345314?\$720_576_PNG\$',
      name: 'Samsung 8K Ultra Televizori',
      price: 1120,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Televizors(
      image:
          'https://www.lg.com/kz/images/televisions/md07504147/gallery/N01_medium01-COPY-1_v1.jpg',
      name: 'LG 32` Televizor',
      price: 320,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Televizors(
      image:
          'https://apollo-olx.cdnvideo.ru/v1/files/w0bqindzdx0r-UZ/image;s=1080x1080',
      name: 'LG televizori',
      price: 240,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Televizors(
      image:
          'https://apollo-olx.cdnvideo.ru/v1/files/7dqihgtil4pc2-UZ/image;s=761x770',
      name: 'Xiaomi 42` televizori',
      price: 432,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Televizors(
      image: 'https://i.ytimg.com/vi/V6snt3Nttf0/maxresdefault.jpg',
      name: 'Xiaomi MI TV',
      price: 345,
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
    allTelevizor = List.of(allTelevizor);

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
          'Televizorlar',
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
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: isLoading ? 6 : allTelevizor.length,
                  itemBuilder: (context, index) {
                    if (isLoading) {
                      return buildFoodShimmer();
                    }
                    final televizor = allTelevizor[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ChangeNotifierProvider.value(
                              value: _counter,
                              child: TelevizorDetails(
                                televizors: televizor,
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
                                  televizor.image,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Text('Internet bilan muammo bor!'),
                                ),
                              ),
                              Text(
                                televizor.name,
                              ),
                              Text('\$${televizor.price}'),
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
