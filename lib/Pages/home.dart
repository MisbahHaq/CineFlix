import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cineflix/Constants/moviecard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<String> imageUrls = [
    "images/damsel.jpg",
    "images/deadpool.jpg",
    "images/dune2.jpg",
    "images/inter.jpg",
    "images/road.jpg",
    "images/zilla.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
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
              SizedBox(
                height: 20,
              ),
              Center(
                child: CarouselSlider(
                  items: imageUrls.map(
                    (url) {
                      return Builder(
                        builder: ((context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    height: 450,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Top Trending Movies",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    MovieCard(
                        MovieName: "Damsel",
                        MovieType: "Adventure, Thriller",
                        MovieImg: "images/damsel2.jpg"),
                    SizedBox(
                      width: 20,
                    ),
                    MovieCard(
                        MovieName: "Dune 2",
                        MovieType: "Action, Thriller",
                        MovieImg: "images/dune22.jpg"),
                    SizedBox(
                      width: 20,
                    ),
                    MovieCard(
                        MovieName: "Deadpool 3",
                        MovieType: "Action, Adventure, Comedy",
                        MovieImg: "images/deadpool2.jpg"),
                    SizedBox(
                      width: 20,
                    ),
                    MovieCard(
                        MovieName: "Interstellar",
                        MovieType: "Adventure, Thriller",
                        MovieImg: "images/inter2.jpg"),
                    SizedBox(
                      width: 20,
                    ),
                    MovieCard(
                        MovieName: "Godzilla",
                        MovieType: "Action, Thriller",
                        MovieImg: "images/godzilla2.jpg"),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}