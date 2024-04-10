import 'package:bhm_app/Core/presentation/widgets/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => (const LoginPage());

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Center(
          child: ListView(
               // mainAxisAlignment: MainAxisAlignment.start,
                children: [
          loginLogo(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            //height: 400, //MediaQuery.of(context).size.width * 1,
            child: const Login(),
          ),
                ],
              ),
        ));
  }
}
