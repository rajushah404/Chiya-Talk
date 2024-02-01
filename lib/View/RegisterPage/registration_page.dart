import 'package:chiya_talk/Basic/color_collection.dart';
import 'package:chiya_talk/Model/Response/register_response.dart';
import 'package:chiya_talk/Services/register_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

import '../LoginPage/login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: AppColor.primaryColor,
            )),
        elevation: 2,
        backgroundColor: Colors.black,
        title: Text(
          "Register Here".toUpperCase(),
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                    child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.fill,
                  height: 300,
                )),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  showCursor: false,
                  controller: nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    label: Text(
                      "Full Name",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    prefixIcon: const Icon(
                      CupertinoIcons.person,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Name is required";
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
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    label: Text(
                      "Username",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    prefixIcon: const Icon(
                      Icons.account_circle_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Username Required";
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
                  controller: passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      label: Text(
                        "Password",
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_open_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 15,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    AppColor.primaryColor,
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(350, 30),
                  ),
                ),
                child: Text(
                  "Register",
                  style: GoogleFonts.montserrat(
                      letterSpacing: 1.3,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {
                  try {
                    final RegisterResponse registerResponse =
                        await RegisterService.register(
                      usernameController.text,
                      passwordController.text,
                      nameController.text,
                    );
                    if (registerResponse.message!.isNotEmpty) {
                      if (registerResponse.message ==
                          "Username Already exists") {
                        EasyLoading.showInfo(
                            registerResponse.message.toString());
                        return;
                      } else {
                        EasyLoading.showSuccess(
                            registerResponse.message.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }
                    } else {
                      EasyLoading.showError(
                          "Registration Failed, Please try again !!");
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
    );
  }
}
