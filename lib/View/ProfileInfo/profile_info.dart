import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Basic/color_collection.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  String? profileImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColor.bgColor,
        title: Text(
          "Profile".toUpperCase(),
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColor.textFiendFont,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickProfileImage,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: profileImageUrl != null
                        ? NetworkImage(profileImageUrl!)
                        : null,
                    child: profileImageUrl == null
                        ? const Icon(Icons.camera_alt,
                            size: 90, color: Colors.grey)
                        : null,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    showCursor: false,
                    controller: firstNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      label: Text(
                        "First Name",
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    showCursor: false,
                    controller: lastNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      label: Text(
                        "Last Name",
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    showCursor: false,
                    controller: contactController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      label: Text(
                        " Contact No. ",
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 90),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColor.primaryColor,
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(278, 30),
                    ),
                  ),
                  child: Text(
                    "Submit..",
                    style: GoogleFonts.montserrat(
                      letterSpacing: 1.3,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pickProfileImage() {
    // Implement image picker logic here and update profileImageUrl
  }
}
