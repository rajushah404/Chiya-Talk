import 'package:chiya_talk/Basic/color_collection.dart';
import 'package:chiya_talk/View/ForgotPasswordPage/forgot_password.dart';
import 'package:chiya_talk/View/home_screen.dart';
import 'package:chiya_talk/View/RegisterPage/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                  // padding: EdgeInsets.all(10),
                  //margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Center(
                        child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.fill,
                      height: 250,
                    )),
                  )),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Welcome Back !".toUpperCase(),
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  showCursor: false,
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    label: Text(
                      "Username",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          letterSpacing: 1.5,
                          color: Colors.white),
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
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  showCursor: false,
                  controller: passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
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
                      )),
                  validator: (value) {
                    if (value == "") {
                      return "Password Required";
                    }
                    return null;
                  },
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
                    const Size(278, 30),
                  ),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.montserrat(
                      letterSpacing: 1.3,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Forgotpassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.acme(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.montserrat(
                          letterSpacing: 1, color: Colors.white, fontSize: 13),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Register here!",
                        style: GoogleFonts.acme(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
