import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/provider/add_to_cart.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int son = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Sevimlilar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 27,
          ),
        ),
      ),
      body: ListView(
        children: [
          Consumer<CounterModel>(
            builder: (context, todo, child) {
              return todo.cartkList.isNotEmpty
                  ? Container(
                      height: 500,
                      child: ListView.builder(
                        itemCount: todo.cartkList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Divider(),
                              ),
                              SizedBox(
                                height: 70,
                                child: ListTile(
                                  leading: Image.network(
                                    todo.cartkList[index].image,
                                    width: 100,
                                    height: 100,
                                  ),
                                  title: Text(todo.cartkList[index].name),
                                  subtitle: Text(
                                    '\$${todo.cartkList[index].price}',
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Divider(),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 80),
                            const SizedBox(
                              width: 350,
                              child: Center(
                                child: Text(
                                  'Bu yerda xozircha hech narsa yo`q',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Image.asset(
                              'assets/empty.png',
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
