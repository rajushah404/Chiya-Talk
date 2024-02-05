import 'package:chiya_talk/Model/Response/message_response.dart';
import 'package:chiya_talk/View/LoginPage/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Basic/color_collection.dart';
import '../../Services/Password Service/confirm_password_service.dart';

class ConfirmPassword extends StatefulWidget {
  final String username;
  final String email;
  final int otp;
  const ConfirmPassword(
      {super.key,
      required this.username,
      required this.email,
      required this.otp});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: AppColor.primaryColor,
            )),
        title: Text(
          "FORGOT PASSWORD",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColor.textFiendFont,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
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
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(
                          "New Password".toUpperCase(),
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
                      style: const TextStyle(color: AppColor.primaryColor),
                      showCursor: false,
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: AppColor.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColor.popColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        label: Text(
                          "Password",
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              letterSpacing: 1.5,
                              color: Colors.white),
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
                            color: AppColor.textFiendFont,
                          ),
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
                    onPressed: () async {
                      if (passwordController.text.isEmpty) {
                        EasyLoading.showInfo("password connot be empty !!");
                        return;
                      }
                      if (passwordController.text.isNotEmpty) {
                        try {
                          final MeassgeResponse meassgeResponse =
                              await ConfirmPassswordService.confirmPassowrd(
                                  widget.username,
                                  widget.email,
                                  widget.otp,
                                  passwordController.text);
                          if (meassgeResponse.statusCode!.isNotEmpty) {
                            if (meassgeResponse.statusCode != "000") {
                              EasyLoading.showInfo(
                                  meassgeResponse.message.toString());
                              return;
                            } else {
                              EasyLoading.showSuccess(
                                  "Password changed sucessfully");

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            }
                          } else {
                            EasyLoading.showError(
                                "Failed, Please try again !!");
                          }
                        } catch (e) {
                          return EasyLoading.showError("$e");
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
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
      ),
    );
  }
}
