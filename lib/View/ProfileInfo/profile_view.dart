import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:chiya_talk/Basic/color_collection.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import '../../Basic/base_url.dart';
import '../../Model/Response/get_user_by_name_response.dart';
import '../../Model/Response/message_response.dart';
import '../../Services/get_details_service.dart';
import '../../Services/update_user_data_service.dart';

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
  bool isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _contactController;
  late TextEditingController _addressController;
  String email = "";
  String baseUrl = BaseUrl.uri;
  String? imagePath;
  String? profileImageUrl;
  File? _pickedImage;
  String? base64Image;
  String? imageName;

  @override
  void initState() {
    super.initState();
    _userDetailsController = StreamController<Map<String, String>>.broadcast();
    _nameController = TextEditingController();
    _contactController = TextEditingController();
    _addressController = TextEditingController();
    fetchUserDetails();
  }

  @override
  void dispose() {
    _userDetailsController.close();
    _nameController.dispose();
    _contactController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  fetchUserDetails() async {
    try {
      GetUserByNameResponse userDetails = await getUserDetails.getUserDetails(
        widget.username.toString(),
        widget.token.toString(),
      );

      imagePath = userDetails.data!.image;

      final userDetailsMap = {
        'Name :': userDetails.data!.name.toString(),
        'Username :': userDetails.data!.username.toString(),
        'Contact :': userDetails.data!.contachNo.toString(),
        'Email :': userDetails.data!.email.toString(),
        'Address :': userDetails.data!.address.toString(),
      };

      _userDetailsController.add(userDetailsMap);

      _nameController.text = userDetails.data!.name.toString();
      _contactController.text = userDetails.data!.contachNo.toString();
      _addressController.text = userDetails.data!.address.toString();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching user details: $error'),
        ),
      );
    }
  }

  void updateProfile() async {
    if (_pickedImage != null) {
      List<int> imageBytes = await _pickedImage!.readAsBytes();
      base64Image = base64Encode(imageBytes);
      imageName = _pickedImage!.path.split('/').last;
    }
    try {
      final MeassgeResponse response = await UpdateUserDataService.updateData(
          _nameController.text,
          widget.username.toString(),
          email,
          _addressController.text,
          _contactController.text,
          "",
          widget.token!,
          imageName.toString(),
          base64Image.toString());

      if (response.statusCode == "001") {
        EasyLoading.showToast(response.message.toString());
        fetchUserDetails();
      }
    } catch (e) {
      return EasyLoading.showError("$e");
    }
  }

  void toggleEditMode() {
    if (isEditing) {
      updateProfile();
    }
    setState(() {
      isEditing = !isEditing;
    });
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
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.done : Icons.edit),
            onPressed: toggleEditMode,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<Map<String, String>>(
            stream: _userDetailsController.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final userDetailsMap = snapshot.data!;
              email = userDetailsMap['Email :']!;

              return Column(
                children: [
                  GestureDetector(
                    child: buildProfileAvatar(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userDetailsMap['Name :']!.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 21,
                      color: AppColor.bgColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.6,
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    color: AppColor.primaryColor,
                  ),
                  ListTile(
                    title: const Text(
                      'Name :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bgColor,
                      ),
                    ),
                    subtitle: isEditing
                        ? TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: userDetailsMap['Name :'],
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.0),
                                ),
                                borderSide: BorderSide(
                                  width: 1.0,
                                ),
                              ),
                            ),
                          )
                        : Text(
                            userDetailsMap['Name :'] ?? '',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColor.bgColor,
                            ),
                          ),
                  ),
                  ListTile(
                    title: const Text(
                      'Username :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bgColor,
                      ),
                    ),
                    subtitle: Text(
                      userDetailsMap['Username :']!,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColor.bgColor,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Contact :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bgColor,
                      ),
                    ),
                    subtitle: isEditing
                        ? TextFormField(
                            controller: _contactController,
                            decoration: InputDecoration(
                              hintText: userDetailsMap['Contact :'],
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.0),
                                ),
                                borderSide: BorderSide(
                                  width: 1.0,
                                ),
                              ),
                            ),
                          )
                        : Text(
                            userDetailsMap['Contact :'] ?? '',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColor.bgColor,
                            ),
                          ),
                  ),
                  ListTile(
                    title: const Text(
                      'Email :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bgColor,
                      ),
                    ),
                    subtitle: Text(
                      userDetailsMap['Email :']!,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColor.bgColor,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Address :',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColor.bgColor,
                      ),
                    ),
                    subtitle: isEditing
                        ? TextFormField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              hintText: userDetailsMap['Address :'],
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.0),
                                ),
                                borderSide: BorderSide(
                                  width: 1.0,
                                ),
                              ),
                            ),
                          )
                        : Text(
                            userDetailsMap['Address :'] ?? '',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColor.bgColor,
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  void _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        profileImageUrl = null;
      });
    }
  }

  Widget buildProfileAvatar() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isEditing ? AppColor.primaryColor : Colors.transparent,
          ),
          child: CircleAvatar(
            radius: 80,
            backgroundImage: _pickedImage != null
                ? FileImage(_pickedImage!) as ImageProvider<Object>?
                : profileImageUrl != null
                    ? NetworkImage("$baseUrl$imagePath")
                    : NetworkImage("$baseUrl$imagePath"),
          ),
        ),
        if (isEditing)
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              child: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
            onPressed: _pickProfileImage,
          ),
      ],
    );
  }
}
