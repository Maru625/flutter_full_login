import 'package:flutter/material.dart';
import 'package:full_login_front/page/login_page_2.dart';

class LoginPage1 extends StatefulWidget {
  LoginPage1({Key? key, required this.setHomeIndex}) : super(key: key);
  Function setHomeIndex;

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),
              ),
              TextFormField(
                controller: pwController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),
              ElevatedButton(
                child: Text("LOGIN"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage2(
                        email: emailController.text,
                        pw: pwController.text,
                        setHomeIndex: widget.setHomeIndex,
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton(
                  child: Text("return to home"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
