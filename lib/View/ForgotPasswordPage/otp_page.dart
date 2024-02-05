import 'package:chiya_talk/Model/Response/message_response.dart';
import 'package:chiya_talk/View/ForgotPasswordPage/password_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Basic/color_collection.dart';
import '../../Services/Password Service/otp_service.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key, required this.username, required this.email});
  final String username;
  final String email;

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController oTPController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              oTPController.clear();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: AppColor.primaryColor,
            )),
        title: Text(
          "Verfiy OTP",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: AppColor.textFiendFont,
          ),
        ),
        centerTitle: true,
        elevation: 2,
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
                        "Verify your otp".toUpperCase(),
                        style: GoogleFonts.montserrat(
                            color: AppColor.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    showCursor: false,
                    controller: oTPController,
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
                        "OTP".toUpperCase(),
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
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                    final int parsedOTP = int.parse(oTPController.text);
                    if (oTPController.text.isEmpty) {
                      EasyLoading.showInfo("Please enter OTP");
                      return;
                    }

                    try {
                      final MeassgeResponse meassgeResponse =
                          await VerifyOTPService.otpCheck(
                              widget.username, widget.email, parsedOTP);
                      if (meassgeResponse.statusCode!.isNotEmpty) {
                        if (meassgeResponse.statusCode != "000") {
                          EasyLoading.showInfo(
                              meassgeResponse.message.toString());
                          return;
                        } else {
                          EasyLoading.showSuccess("User verifird");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmPassword(
                                username: widget.username,
                                email: widget.email,
                                otp: parsedOTP,
                              ),
                            ),
                          );
                        }
                      } else {
                        EasyLoading.showError("Failed, Please try again !!");
                      }
                    } catch (e) {
                      return EasyLoading.showError("$e");
                    }
                  },
                ),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
