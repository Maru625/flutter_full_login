import 'package:flutter/material.dart';
import 'package:full_login_front/page/login_page_1.dart';

class LoginJoinWidget extends StatefulWidget {
  LoginJoinWidget({Key? key, required this.setHomeIndex}) : super(key: key);
  Function setHomeIndex;

  @override
  State<LoginJoinWidget> createState() => _LoginJoinWidgetState();
}

class _LoginJoinWidgetState extends State<LoginJoinWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text("LOGIN"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage1(setHomeIndex: widget.setHomeIndex),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text("ADD TO ACCOUNT"),
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
            )
          ]),
    );
  }
}
