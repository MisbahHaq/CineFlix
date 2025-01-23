import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = [
    "assets/images/damsel.jpg",
    "assets/images/deadpool.jpg",
    "assets/images/dune2.jpg",
    "assets/images/infinity.jpg",
    "assets/images/inter.jpg",
    "assets/images/road.jpg",
    "assets/images/zilla.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hello, Misbah',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "images/goku.jpg",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Welcome To,',
              style: GoogleFonts.poppins(
                  color: Color.fromARGB(186, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
            Row(
              children: [
                Text(
                  "Cine",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Flix",
                  style: GoogleFonts.poppins(
                    color: Color(0xffedb41d),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Center(
                child: CarouselSlider(
                    items: imageUrls.map(
                      (url) {
                        return Builder(
                          builder: ((context) {
                            return Image.asset(
                              url,
                              fit: BoxFit.cover,
                            );
                          }),
                        );
                      },
                    ).toList(),
                    options: CarouselOptions()))
          ],
        ),
      ),
    );
  }
}
