import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Karusel extends StatefulWidget {
  const Karusel({Key? key}) : super(key: key);

  @override
  State<Karusel> createState() => _KaruselState();
}

class _KaruselState extends State<Karusel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.destructiveRed,
          borderRadius: BorderRadius.circular(20),
        ),
        width: 200,
        height: 200,
        child: CarouselSlider(
          items: [
            Image.network(
              'https://cdn.pixabay.com/photo/2017/10/27/12/28/black-friday-2894130_960_720.png',
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
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Image.network(
                'https://thumbs.dreamstime.com/b/discount-summer-spring-promotion-sale-spring-sale-poster-off-discount-promotion-sale-138001463.jpg',
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
            ),
            Image.network(
              'https://image.shutterstock.com/image-vector/promo-sale-banner-library-bookshop-260nw-1790872166.jpg',
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
          ],
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
