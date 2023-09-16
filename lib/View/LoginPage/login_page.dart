import 'package:chiya_talk/Basic/color_collection.dart';
import 'package:chiya_talk/Model/Response/login_token_response.dart';
import 'package:chiya_talk/View/home_screen.dart';
import 'package:chiya_talk/View/RegisterPage/registration_page.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  DateTime currentBackPressTime = DateTime.now();

  EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();

  @override
  void dispose() {
    usernameController.clear();
    passwordController.clear();
    setState(() {});
    super.dispose();
  }

  // late LoginBloc _loginBloc;

  // @override
  // void initState() {
  //    _loginBloc = LoginBloc(loginService);
  //   super.initState();
  // }

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
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
                    try {
                      final LoginTokenResponse response =
                          await AuthService.login(
                              usernameController.text, passwordController.text);

                      if (response.status == "000") {
                        EasyLoading.showSuccess("Logging Sucessfull");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        EasyLoading.showError("Credientials not match !!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }
                    } catch (e) {
                      return EasyLoading.showError("$e");
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          EasyLoading.showInfo("Feature Under construction");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const Forgotpassword(),
                          //   ),
                          // );
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
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 13),
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
      ),
    );
  }
}
