import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tez_mall/pages/page1_utilites/page1_category.dart';
import 'package:tez_mall/pages/page1_utilites/page1_qiziqarli.dart';
import 'package:tez_mall/pages/page1_utilites/slider.dart';

// ignore: must_be_immutable
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  void DialogShow(String title, Widget content, BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black38,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
      },
    );
  }

  @override
  void initState() {
    checkConnectionOn(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Ilovadan qidirish...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const FaIcon(FontAwesomeIcons.bell),
                  ),
                ],
              ),
            ),
            ////////// Causel Slider
            const Karusel(),
            ///////////
            ///
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'Kategoriyalar',
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
                Text(
                  'Barchasini ko`rish',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 200,
              width: double.infinity,
              child: Page1Kategoriya(),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Image.network(
                'https://click.uz/uploads/20201214/ainvc680c8cd0353b539c91456530567df211607926755.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text(
                  'Eng qiziqarlilari',
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
                Text(
                  'Barchasini ko`rish',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: double.infinity,
              height: 200,
              child: Qiziqarli(),
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0wpFPMWLb91qLCmWNYzqO1r9fwU7L0jntTw&usqp=CAU',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkConnectionOn(BuildContext context) async {
    final StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            alertPop();

            progressAlert(context);
            break;
          case InternetConnectionStatus.disconnected:
            DialogShow(
                'Error',
                const Text(
                  'Internet bilan muammo mavjud',
                  style: TextStyle(fontSize: 16),
                ),
                context);
            break;
        }
      },
    );
    await Future<void>.delayed(const Duration(seconds: 10));
    await listener.cancel();
  }
}
