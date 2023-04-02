// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/login_provider.dart';
import 'package:flutter_app/ui/facilities/home_page.dart';
import 'package:flutter_app/ui/login/login_form.dart';
import 'package:flutter_app/ui/login/login_header.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context);

    if (provider.state == LoginState.initial) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [LoginHeader(), LoginForm()],
      );
    } else if (provider.state == LoginState.succeeded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      });
      return Container();
    } else if (provider.state == LoginState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
