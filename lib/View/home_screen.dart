import 'package:chiya_talk/Basic/color_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "ChiyaTalk",
          style: GoogleFonts.montserrat(
            letterSpacing: 1.5,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColor.bgColor,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColor.bgColor,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: AppColor.bgColor,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          "Loading...................",
          style: GoogleFonts.aboreto(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue),
        ),
      ),
    );
  }
}
