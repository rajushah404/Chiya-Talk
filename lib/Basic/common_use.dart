import 'package:chiya_talk/View/LoginPage/login_page.dart';
import 'package:flutter/material.dart';

Future<void> showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('Logout ?'),
        content: const Text('Are you sure you want to log out ?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}

void options(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.topRight,
        child: AlertDialog(
          title: const Text("More Options"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("View Profile"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildBottomAppBarButton(
    {required String label, required VoidCallback onPressed}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(label),
  );
}
