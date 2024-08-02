import 'package:bhm_app/Core/data/repositories/login_repositoryImpl.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:bhm_app/Core/presentation/widgets/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_bloc.dart';
import 'package:bhm_app/Core/domain/usecases/load_login_data.dart';
import 'package:dio/dio.dart';


void main() => runApp(const LoginPage());

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => LoginBloc(
            LoadLoginData(LoginRepositoryImpl(dio: Dio(), tokenStorage :TokenStorage())),
            LoginRepositoryImpl(dio: Dio(), tokenStorage:TokenStorage()),
          ),
          child: Center(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: loginLogo()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Login(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
