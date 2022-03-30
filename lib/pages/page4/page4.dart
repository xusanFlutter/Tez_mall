import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tez_mall/provider/add_to_cart.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CounterModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profil',
          style: TextStyle(
            fontSize: 27,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Row(
            children: const [
              SizedBox(width: 20),
              Text(
                'Shaxsiy malumotlar:',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 15),
              const Icon(
                Icons.person,
                size: 35,
                color: Colors.red,
              ),
              const SizedBox(width: 10),
              Text(
                count.name.isNotEmpty ? count.name : 'Tolibov Husan',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 15),
              const Icon(
                Icons.email,
                color: Colors.red,
                size: 35,
              ),
              const SizedBox(width: 10),
              Text(
                count.email.isNotEmpty ? count.name : 'startolibov@gmail.com',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 15),
              const Icon(
                Icons.phone,
                color: Colors.red,
                size: 35,
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  const Text(
                    '+998 9',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    count.phone.isEmpty ? '42558955' : count.phone,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 35),
          Row(
            children: const [
              SizedBox(width: 20),
              Text(
                'Boshqalar',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              SizedBox(width: 15),
              FaIcon(
                FontAwesomeIcons.gift,
                color: Colors.red,
                size: 35,
              ),
              SizedBox(width: 10),
              Text(
                'Buyurtmani kuzatish',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              SizedBox(width: 15),
              FaIcon(
                FontAwesomeIcons.bell,
                color: Colors.red,
                size: 35,
              ),
              SizedBox(width: 10),
              Text(
                'Bildirishnomalar',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              SizedBox(width: 15),
              FaIcon(
                FontAwesomeIcons.locationArrow,
                color: Colors.red,
                size: 35,
              ),
              SizedBox(width: 10),
              Text(
                'Qabal qilish punktlari',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              SizedBox(width: 15),
              Icon(
                Icons.settings,
                color: Colors.red,
                size: 35,
              ),
              SizedBox(width: 10),
              Text(
                'Sozlamalar',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300],
              ),
              width: 100,
              height: 100,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Savolaringiz bormi? Qo`ng`iroq qiling!',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(
                    '+998 (94) 255-89-55',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
