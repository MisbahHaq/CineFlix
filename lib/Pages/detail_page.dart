import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final String MovieName;
  final String Movietype;
  final String MovieImg;
  final String MovieDescrip;

  DetailPage({
    super.key,
    required this.MovieName,
    required this.Movietype,
    required this.MovieImg,
    required this.MovieDescrip,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> getFormattedDates() {
    final now = DateTime.now();
    final formatter = DateFormat("EEE d");
    return List.generate(7, (index) {
      final date = now.add(Duration(days: index));
      return formatter.format(date);
    });
  }

  int track = 0; // Tracks the selected date
  String selectedTime = ""; // Tracks the selected time

  @override
  Widget build(BuildContext context) {
    final dates = getFormattedDates();
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff1e232c),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  widget.MovieImg,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.5),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff1e232c),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie Details
                      Text(
                        widget.MovieName,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.Movietype,
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(174, 255, 255, 255),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.MovieDescrip,
                        style: TextStyle(
                          color: Color.fromARGB(174, 255, 255, 255),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Select Date Section
                      Text(
                        "Select Date",
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(174, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dates.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                track = index;
                                setState(() {});
                              },
                              child: Container(
                                width: 100,
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: Color(0xffeed51e),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: track == index
                                        ? Colors.white
                                        : Colors.black,
                                    width: 3,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    dates[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      // Select Time Slot Section
                      Text(
                        "Select Time Slot",
                        style: GoogleFonts.poppins(
                          color: Color.fromARGB(174, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildTimeSlotButton("7:30 PM"),
                            SizedBox(width: 20),
                            buildTimeSlotButton("10:00 PM"),
                            SizedBox(width: 20),
                            buildTimeSlotButton("12:30 AM"),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      // Book Now Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Ticket Counter
                          Container(
                            width: 140,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Logic to increase tickets
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  "1",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xffeed51e),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Logic to decrease tickets
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          // Book Now Button
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Booking logic
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  color: Color(0xffeed51e),
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total: \$50",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Book Now",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function for reusable time slot buttons
  Widget buildTimeSlotButton(String time) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selectedTime == time ? Color(0xffeed51e) : Colors.transparent,
          border: Border.all(
            color: Color(0xffeed51e),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          time,
          style: GoogleFonts.poppins(
            color: selectedTime == time ? Colors.black : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
