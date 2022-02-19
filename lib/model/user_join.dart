import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // json.decode 함수를 사용하기 위함

addUser(String email, String nickname, String password) {
  final response = http.post(
    Uri.parse('http://0.0.0.0:8000/user/join/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'nickname': nickname,
      'password': password,
    }),
  );

  return FutureBuilder(
    future: response,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      print(snapshot.hasData);
      if (snapshot.hasData) {
        return AlertDialog(
          title: Text("회원가입 성공"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: Text("OK"))
          ],
        );
      } else if (snapshot.hasError) {
        return AlertDialog(
          title: Text("회원가입 실패"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      }
      return AlertDialog(
        title: CircularProgressIndicator(),
      );
    },
  );
}
