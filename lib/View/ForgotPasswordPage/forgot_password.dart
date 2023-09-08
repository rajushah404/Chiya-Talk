import 'package:chiya_talk/Basic/color_collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        title: Text(
          "FORGOT PASSWORD",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColor.textFiendFont,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  // padding: EdgeInsets.all(10),
                  //margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Center(
                      child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.fill,
                    height: 300,
                  )),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: [
                      Text(
                        "Verify your username".toUpperCase(),
                        style: GoogleFonts.montserrat(
                            color: AppColor.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    showCursor: false,
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor.textFiendFont,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.primaryColor),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      label: Text(
                        "Email".toUpperCase(),
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            letterSpacing: 1.5,
                            color: AppColor.textFiendFont),
                      ),
                      prefixIcon: const Icon(
                        Icons.account_circle_outlined,
                        size: 20,
                        color: AppColor.textFiendFont,
                      ),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "Email Required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Center(
                    child: Text(
                      " OTP will be sent to your Email-ID".toUpperCase(),
                      style: GoogleFonts.montserrat(
                        color: AppColor.textFiendFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    "Submit",
                    style: GoogleFonts.montserrat(
                        letterSpacing: 1.3,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {},
                ),
                const SizedBox(
                  height: 120,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "It's Your Duty To Remember Your Password !!  ",
                      style: GoogleFonts.aladin(
                          letterSpacing: 1.5,
                          color: AppColor.warningColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
