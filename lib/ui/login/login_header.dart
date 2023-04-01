// ignore: file_names
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/login_provider.dart';
import '../../utils/global.colors.dart';

class LoginHeader extends StatefulWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  State<LoginHeader> createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> {
  LoginState state = LoginState.initial;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);
    state = provider.state;
    return LoginHeader();
  }

  LoginHeader() {
    var logo = Logo();
    var greetingText = GreetingText();

    return Column(
      children: [logo, greetingText],
    );
  }

  // Logo
  Logo() {
    return SizedBox(
      child: Image.asset('images/logoLogin.jpg'),
    );
  }

// Greeting Text
  GreetingText() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Welcome Again!',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: GlobalColors().purple),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('We are happy to see you again!',
            style: TextStyle(fontSize: 12)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
