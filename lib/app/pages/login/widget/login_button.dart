import 'package:flutter/material.dart';
import 'package:news_app/app/widget/widget.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalButton(
      text: 'Login',
      //onTap: NavigateTo.homeScreen,
    );
  }
}
