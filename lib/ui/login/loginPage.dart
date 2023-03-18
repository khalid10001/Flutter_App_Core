// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/loginProvider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  LoginState state = LoginState.initial;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  var email = "";
  var errorMessage = "Wrong Information";
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);
    state = provider.state;
    return Scaffold(
      body: Body(),
    );
  }

  loginForm() {
    var logo = Logo();
    var greetingText = GreetingText();
    var email = Email();
    var password = Password();
    var loginButton = LoginButton();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo,
              greetingText,
              email,
              password,
              loginButton,
            ],
          ),
        )),
      ),
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
      children: const [
        SizedBox(
          height: 20,
        ),
        Text(
          'Welcome Again!',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.purple),
        ),
        SizedBox(
          height: 10,
        ),
        Text('We are happy to see you again!', style: TextStyle(fontSize: 12)),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

// Email address
  Email() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: TextStyle(
              color: Colors.purple,
              fontSize: 13,
            ),
          ),
          TextFormField(
            controller: emailController,
            validator: validateEmail,
            decoration: InputDecoration(
              labelText: 'Add Email Here',
              labelStyle: const TextStyle(color: Colors.purple),
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
          const Text(
            'Password',
            style: TextStyle(fontSize: 13, color: Colors.purple),
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
              hintStyle: const TextStyle(color: Colors.purple),
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
        primary: const Color.fromARGB(255, 220, 92, 13),
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

//Switch case
  Body() {
    switch (state) {
      case LoginState.initial:
        return loginForm();
      case LoginState.loading:
        return const Center(child: CircularProgressIndicator());
      case LoginState.failed:
        return loginForm();
      case LoginState.succeeded:
        return const Center(child: Text('Login succeeded'));
    }
  }

  ErrorMessage() {
    return Text(
      errorMessage,
      style: const TextStyle(color: Colors.red),
    );
  }
}
