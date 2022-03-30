import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/category/telefon/telefon_details.dart';
import 'package:tez_mall/category/televizor/televizors.dart';
import 'package:tez_mall/provider/add_to_cart.dart';
import 'package:tez_mall/shimmer/shimmer_effect.dart';

class Telefons {
  String name;
  String image;
  int price;
  String description;

  Telefons({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  void add(Telefons telefons) {}
}

class Telefon extends StatefulWidget {
  const Telefon({Key? key}) : super(key: key);

  @override
  State<Telefon> createState() => _TelefonState();
}

class _TelefonState extends State<Telefon> {
  List<Telefons> allTelefon = [
    Telefons(
      image:
          'https://images.samsung.com/is/image/samsung/p6pim/ru/2202/gallery/ru-galaxy-s22-plus-s906-sm-s906bidgser-530894558',
      name: 'Samsung Galaxy S22',
      price: 1015,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Telefons(
      image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-family-hero?wid=470&hei=556&fmt=png-alpha&.v=1645036276543',
      name: 'iPhone 13',
      price: 1120,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Telefons(
      image:
          'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-family-select-2021?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1617135051000',
      name: 'iPhone 12',
      price: 599,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Telefons(
      image:
          'https://images.samsung.com/is/image/samsung/p6pim/uz_ru/sm-a225flgdskz/gallery/uz-ru-galaxy-a22-a225-sm-a225flgdskz-523476272?\$720_576_PNG\$',
      name: 'Samsung Galaxy A22',
      price: 240,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Telefons(
      image:
          'https://i01.appmifile.com/webfile/globalimg/gaoruijia/RN-10-PRO-gold.png',
      name: 'Xiaomi Redmi Note 10 Pro',
      price: 432,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae pellentesque odio. Proin non tincidunt enim. Duis ut metus suscipit, faucibus odio et, varius magna.',
    ),
    Telefons(
      image:
          'https://mi-store.uz/image/cache/catalog/smart/pocox3pro/poco-x3-pro-black-1-800x800-650x650.jpg',
      name: 'Xiaomi POCO X3 Pro',
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
    allTelefon = List.of(allTelefon);

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
          'Smarfonlar',
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
                  itemCount: isLoading ? 6 : allTelefon.length,
                  itemBuilder: (context, index) {
                    if (isLoading) {
                      return buildFoodShimmer();
                    }
                    final telefon = allTelefon[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ChangeNotifierProvider.value(
                              value: _counter,
                              child: TelefonsDetails(
                                telefons: telefon,
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
                                  telefon.image,
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
                                telefon.name,
                              ),
                              Text('\$${telefon.price}'),
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



TextEditingController name = TextEditingController();
TextEditingController number = TextEditingController();
TextEditingController mmgg = TextEditingController();
TextEditingController password = TextEditingController();


class AddChat2 {
  final String name;
  final dynamic time;
  final String ball;
  final String title;

  AddChat2({
    required this.name,
    required this.time,
    required this.ball,
    required this.title,
  });
}
