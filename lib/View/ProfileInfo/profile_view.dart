import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chiya_talk/Basic/color_collection.dart';
import '../../Model/Response/get_user_by_name_response.dart';
import '../../Services/get_details_service.dart';

class ProfileView extends StatefulWidget {
  final String? username;
  final String? token;

  const ProfileView({Key? key, this.username, this.token}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  GetUserDetails getUserDetails = GetUserDetails();
  late StreamController<Map<String, String>> _userDetailsController;

  @override
  void initState() {
    super.initState();
    _userDetailsController = StreamController<Map<String, String>>.broadcast();
    fetchUserDetails();
    setState(() {});
  }

  @override
  void dispose() {
    _userDetailsController.close();
    super.dispose();
  }

  fetchUserDetails() async {
    try {
      GetUserByNameResponse userDetails = await getUserDetails.getUserDetails(
        widget.username.toString(),
        widget.token.toString(),
      );

      final userDetailsMap = {
        'Name :': userDetails.data!.name.toString().toUpperCase(),
        'Username :': userDetails.data!.username.toString(),
        'Contact :': userDetails.data!.contachNo.toString(),
        'Email :': userDetails.data!.email.toString(),
        'Address :': userDetails.data!.address.toString(),
      };

      _userDetailsController.add(userDetailsMap);
    } catch (error) {
      Text('Error fetching user details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(CupertinoIcons.back),
        ),
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<Map<String, String>>(
          stream: _userDetailsController.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            final userDetailsMap = snapshot.data!;

            return Form(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userDetailsMap['Username :'] ?? '',
                    style: const TextStyle(
                        fontSize: 21,
                        color: AppColor.bgColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.6),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    color: AppColor.primaryColor,
                  ),
                  ...userDetailsMap.entries.map((entry) {
                    return ListTile(
                      title: Text(
                        entry.key,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: AppColor.bgColor),
                      ),
                      subtitle: Text(
                        entry.value,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: AppColor.bgColor),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
