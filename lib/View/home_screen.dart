import 'dart:io';

import 'package:chiya_talk/Basic/color_collection.dart';
import 'package:chiya_talk/View/LoginPage/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final String? profileImageUrl;

  const HomeScreen({super.key, this.profileImageUrl});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    profileImageUrl = widget.profileImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.textFiendFont,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: profileImageUrl != null
                  ? FileImage(File(profileImageUrl!))
                  : null,
              backgroundColor: Colors.transparent,
              child: profileImageUrl != null
                  ? ClipOval(
                      child: Image(
                        image: FileImage(File(profileImageUrl!)),
                        fit: BoxFit.fill,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              "ChiyaTalk",
              style: GoogleFonts.montserrat(
                letterSpacing: 1.5,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColor.bgColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColor.bgColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.logout_outlined,
              color: AppColor.bgColor,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: profileImageUrl != null
                  ? FileImage(File(profileImageUrl!))
                  : null,
              backgroundColor: Colors.transparent,
              child: profileImageUrl != null
                  ? ClipOval(
                      child: Image(
                        image: FileImage(File(profileImageUrl!)),
                        fit: BoxFit.fill,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: AppColor.primaryColor,
          surfaceTintColor: AppColor.warningColor,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Chat"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Updates"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Calls"),
              )
            ],
          )),
    );
  }
}
