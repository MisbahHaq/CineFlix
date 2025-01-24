import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cineflix/Constants/moviecard.dart';
import 'package:cineflix/Pages/detail_page.dart';
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                                MovieName: "Damsel",
                                Movietype: "Adventure, Thriller",
                                MovieImg: "images/damsel2.jpg",
                                MovieDescrip:
                                    "A dutiful damsel agrees to marry a handsome prince, only to find the royal family has recruited her as a sacrifice to repay an ancient debt. Thrown into a cave with a fire-breathing dragon, she must rely on her wits and will to survive."),
                          ),
                        );
                      },
                      child: MovieCard(
                          MovieName: "Damsel",
                          MovieType: "Adventure, Thriller",
                          MovieImg: "images/damsel2.jpg"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                                MovieName: "Dune 2",
                                MovieImg: "images/dune22.jpg",
                                Movietype: "Action, Thriller",
                                MovieDescrip:
                                    "Dune: Part Two will explore the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a warpath of revenge against the conspirators who destroyed his family."),
                          ),
                        );
                      },
                      child: MovieCard(
                          MovieName: "Dune 2",
                          MovieType: "Action, Thriller",
                          MovieImg: "images/dune22.jpg"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                                MovieName: "Deadpool 3",
                                Movietype: "Action, Adventure, Comedy",
                                MovieImg: "images/deadpool2.jpg",
                                MovieDescrip:
                                    "Marvel Studios' ”Deadpool & Wolverine” finds Wade Wilson with his past as the morally flexible Deadpool behind him, until he suddenly finds himself in a fight for the survival of his homeworld and must suit-up again—and convince a reluctant Wolverine to help him."),
                          ),
                        );
                      },
                      child: MovieCard(
                          MovieName: "Deadpool 3",
                          MovieType: "Action, Adventure, Comedy",
                          MovieImg: "images/deadpool2.jpg"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  MovieName: "Interstellar",
                                  Movietype: "Adventure, Thriller",
                                  MovieImg: "images/inter2.jpg",
                                  MovieDescrip:
                                      "Interstellar is about Earth's last chance to find a habitable planet before a lack of resources causes the human race to go extinct. The film's protagonist is Cooper (Matthew McConaughey), a former NASA pilot who is tasked with leading a mission through a wormhole to find a habitable planet in another galaxy.")),
                        );
                      },
                      child: MovieCard(
                          MovieName: "Interstellar",
                          MovieType: "Adventure, Thriller",
                          MovieImg: "images/inter2.jpg"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  MovieName: "Godzilla",
                                  Movietype: "Action, Thriller",
                                  MovieImg: "images/godzilla2.jpg",
                                  MovieDescrip:
                                      "Post-war Japan is at its lowest point when a new crisis emerges in the form of a giant monster, baptized in the horrific power of the atomic bomb. Post-war Japan is at its lowest point when a new crisis emerges in the form of a giant monster, baptized in the horrific power of the atomic bomb.")),
                        );
                      },
                      child: MovieCard(
                          MovieName: "Godzilla",
                          MovieType: "Action, Thriller",
                          MovieImg: "images/godzilla2.jpg"),
                    ),
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
