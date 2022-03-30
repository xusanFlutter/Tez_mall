import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tez_mall/category/sport/sport.dart';
import 'package:tez_mall/category/sport/sport_chat.dart';

class SportsPay extends StatefulWidget {
  Sports sports;
  SportsPay({Key? key, required this.sports}) : super(key: key);

  @override
  State<SportsPay> createState() => _SportsPayState();
}

class _SportsPayState extends State<SportsPay> {
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
                  widget.sports.image,
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
                    widget.sports.name,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$${widget.sports.price}',
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