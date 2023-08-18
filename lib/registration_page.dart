import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text("Registration Page",
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
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
              Container(
                // padding: EdgeInsets.all(10),
                //margin: const EdgeInsets.all(10),
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
                margin: const EdgeInsets.all(15),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  showCursor: false,
                  controller: emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    label: Text(
                      "Email",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          letterSpacing: 1.5,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      size: 20,
                      color: Colors.black,
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
                  style: const TextStyle(color: Colors.black),
                  showCursor: false,
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
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
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
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
                    const Size(300, 30),
                  ),
                ),
                child: Text(
                  "Register",
                  style: GoogleFonts.montserrat(
                      letterSpacing: 1.3,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
