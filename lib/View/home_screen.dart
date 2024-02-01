import 'dart:io';

import 'package:chiya_talk/Basic/color_collection.dart';
import 'package:chiya_talk/Services/get_details_Service.dart';
import 'package:chiya_talk/View/ProfileInfo/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Basic/base_url.dart';
import '../Basic/common_use.dart';
import '../Model/Response/get_user_by_name_response.dart';

class HomeScreen extends StatefulWidget {
  final String? profileImageUrl;
  final String? username;
  final String? token;

  const HomeScreen({Key? key, this.profileImageUrl, this.username, this.token})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? profileImageUrl;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  GetUserDetails getUserDetails = GetUserDetails();
  String? name;
  String? imagePath;
  String baseUrl = BaseUrl.uri;

  @override
  void initState() {
    super.initState();
    profileImageUrl = widget.profileImageUrl;
    fetchUserDetails();
    setState(() {});
  }

  fetchUserDetails() async {
    try {
      GetUserByNameResponse userDetails = await getUserDetails.getUserDetails(
          widget.username.toString(), widget.token.toString());

      setState(() {
        name = userDetails.data!.name.toString().toUpperCase();
        imagePath = userDetails.data!.image.toString();
      });
    } catch (error) {
      Text('Error fetching user details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        shape: Border.all(),
        width: 275,
        backgroundColor: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage("$baseUrl$imagePath"),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        name.toString(),
                        style: const TextStyle(
                            color: AppColor.textFiendFont,
                            fontSize: 14,
                            letterSpacing: 1.6),
                      )
                    ],
                  ),
                  const Divider(
                    height: 25,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfileView(
                                username: widget.username,
                                token: widget.token,
                              )));
                    },
                    child: Card(
                      shape: Border.all(),
                      color: Colors.black87,
                      elevation: 2,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.key,
                              size: 20,
                              color: AppColor.textFiendFont,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  letterSpacing: 1.5,
                                  color: AppColor.textFiendFont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    shape: Border.all(),
                    color: Colors.black87,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.settings,
                              color: AppColor.textFiendFont,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Setting",
                            style: TextStyle(
                                letterSpacing: 1.5,
                                color: AppColor.textFiendFont,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Divider(
                    height: 35,
                    color: AppColor.primaryColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      showLogoutConfirmationDialog(context);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          size: 20,
                          color: AppColor.primaryColor,
                        ),
                        SizedBox(
                          width: 56,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 17,
                              letterSpacing: 1.6,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.textFiendFont,
      appBar: buildAppBar(),
      body: buildBody(),
      // bottomNavigationBar: buildBottomAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: false,
      toolbarHeight: 50,
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.primaryColor,
      title: buildAppBarTitle(),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: AppColor.bgColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: AppColor.bgColor,
          ),
          onPressed: () {
            _globalKey.currentState!.openDrawer();
          },
        )
      ],
    );
  }

  Widget buildAppBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildProfileAvatar(radius: 16),
        const SizedBox(width: 8),
        Text(
          "ChiyaTalk",
          style: GoogleFonts.montserrat(
            letterSpacing: 1.5,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColor.bgColor,
          ),
        ),
      ],
    );
  }

  Widget buildProfileAvatar({double? radius}) {
    return CircleAvatar(
      radius: radius ?? 50,
      backgroundImage:
          profileImageUrl != null ? FileImage(File(profileImageUrl!)) : null,
      backgroundColor: Colors.transparent,
      child: profileImageUrl != null
          ? ClipOval(
              child: Image(
                image: FileImage(File(profileImageUrl!)),
                fit: BoxFit.fill,
              ),
            )
          : null,
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Center(
          child: buildProfileAvatar(radius: 50),
        ),
      ],
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      color: AppColor.primaryColor,
      surfaceTintColor: AppColor.warningColor,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBottomAppBarButton(label: "Chat", onPressed: () {}),
          buildBottomAppBarButton(label: "Updates", onPressed: () {}),
          buildBottomAppBarButton(label: "Calls", onPressed: () {}),
        ],
      ),
    );
  }
}
