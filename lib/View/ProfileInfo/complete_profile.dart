import 'dart:io';
import 'package:chiya_talk/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../Basic/color_collection.dart';
import '../../Model/Response/message_response.dart';
import '../../Services/update_profile_servide.dart';

class ProfileInfo extends StatefulWidget {
  final String token;
  final String username;
  const ProfileInfo({Key? key, required this.token, required this.username})
      : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? profileImageUrl;
  File? _pickedImage;
  String? base64Image;
  String? imageName;

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
        automaticallyImplyLeading: false,
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
                    backgroundImage: _pickedImage != null
                        ? FileImage(_pickedImage!) as ImageProvider<Object>?
                        : profileImageUrl != null
                            ? NetworkImage(profileImageUrl!)
                            : null,
                    child: _pickedImage == null && profileImageUrl == null
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
                    controller: emailController,
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
                        "Email",
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
                    controller: addressController,
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
                        "Address",
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
                  onPressed: () async {
                    try {
                      final MeassgeResponse response =
                          await UpdateProfileSerice.update(
                        widget.username,
                        emailController.text,
                        addressController.text,
                        contactController.text,
                        widget.token,
                      );

                      if (response.message!.isNotEmpty) {
                        EasyLoading.showToast(response.message.toString());
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              username: widget.username,
                              token: widget.token,
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      return EasyLoading.showError("$e");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        profileImageUrl = null;
      });
    }
  }
}
