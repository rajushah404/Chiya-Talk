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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                // padding: EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                child: Center(
                    child: Image.asset(
                  "assets/logo.png",
                  color: Colors.blue,
                  fit: BoxFit.fill,
                  height: 300,
                )),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  showCursor: false,
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
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
                          color: Colors.black),
                    ),
                    prefixIcon: const Icon(
                      Icons.account_circle_outlined,
                      size: 20,
                      color: Colors.black,
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
                  style: const TextStyle(color: Colors.black),
                  showCursor: false,
                  controller: passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      label: Text(
                        "Password",
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            letterSpacing: 1.5,
                            color: Colors.black),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_open_outlined,
                        size: 20,
                        color: Colors.black,
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
                          color: Colors.black,
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
                    Colors.blue,
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
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {},
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.montserrat(
                            color: Colors.blue, fontWeight: FontWeight.bold),
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
                          letterSpacing: 1, color: Colors.black, fontSize: 13),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Register here!",
                        style: GoogleFonts.montserrat(
                            color: Colors.blue, fontWeight: FontWeight.bold),
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
