// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/facilities/home_page.dart';
import 'package:flutter_app/utils/global.colors.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  var email = "";
  var errorMessage = "";
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return loginForm();
  }

  //Switch case

  loginForm() {
    var email = Email();
    var password = Password();
    var loginButton = LoginButton();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          email,
          password,
          loginButton,
          ErrorMessage(),
        ],
      ),
    );
  }

// Email address
  Email() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(
              color: GlobalColors().purple,
              fontSize: 13,
            ),
          ),
          TextFormField(
            controller: emailController,
            validator: validateEmail,
            decoration: InputDecoration(
              labelText: 'Add Email Here',
              labelStyle: TextStyle(color: GlobalColors().purple),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

// Validation for email
  String? validateEmail(String? email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (email != null && regExp.hasMatch(email)) {
      return null;
    } else {
      const String errorText = 'Please enter a valid email';
      return errorText;
    }
  }

// Password
  Password() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: TextStyle(fontSize: 13, color: GlobalColors().purple),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: GlobalColors().purple),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            heightFactor: 02,
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'Forgot Password?',
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

// Login Button
  LoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: GlobalColors().orange,
        padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 20),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {
        LoginProvider().login(emailController.text, "password");
      },
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  ErrorMessage() {
    return Text(
      errorMessage,
      style: const TextStyle(color: Colors.red),
    );
  }
}
