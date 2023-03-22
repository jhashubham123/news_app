import 'package:flutter/material.dart';
import 'package:news_app/app/app.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
      ),
      body: LoginWidget(),
    );
  }
}
