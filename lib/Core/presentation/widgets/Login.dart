import 'package:bhm_app/Core/presentation/screens/HomePage.dart';
import 'package:bhm_app/Core/presentation/screens/RegistroLogin.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_state.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  bool _ifChecked = false;
  bool isPasswordVisible = false;

  Future<void> auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
          localizedReason: "Autenticate para acceder",
          options: const AuthenticationOptions(
              stickyAuth: true, useErrorDialogs: true));
    } catch (e) {
      print(e);
    }
    if (authenticated) {
      Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomePage()));
    } else {
      print("Fallo auth");
    }
  }

  @override
  Widget build(BuildContext context) {
    void togglePasswordView() {
      setState(() {
        isPasswordVisible = !isPasswordVisible;
      });
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => const HomePage()));
           Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomePage()));
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed')),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          loginInputs(context, togglePasswordView, isPasswordVisible),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: _ifChecked,
                onChanged: (newValue) => {setState(() => _ifChecked = newValue!)},
              ),
              const Text('Mantener Sesión'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(LoginSubmitted());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF16697A),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'INGRESAR',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const RegistroLogin()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF16697A),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'REGISTRARSE',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          IconButton(
              onPressed: () {
                auth();
              },
              color: const Color(0xffFFB997),
              icon: const Icon(
                Icons.fingerprint,
                size: 50,
                color: Color(0xffFF6347),
              ))
        ],
      ),
    );
  }
}

//////ELEMENTOS DEL LOGIN

Widget loginLogo() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 150,
        height: 150,
        child: Image.asset('assets/images/LogoShort.png', fit: BoxFit.fill),
      ),
      const Text(
        'BHM',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Color(0xff16697A),
        ),
      ),
    ],
  );
}

Widget loginInputs(BuildContext context, VoidCallback togglePasswordView, bool isPasswordVisible) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // Alinea los textos a la izquierda.
    children: [
      TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: 'USUARIO',
          hintText: 'Numero de telefono',
        ),
        onChanged: (value) {
          context.read<LoginBloc>().add(UserEmailChanged(value));
        },
      ),
      const SizedBox(height: 8),
      TextField(
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          labelText: 'CONTRASEÑA',
          hintText: 'Ingresa tu contraseña',
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: togglePasswordView,
          ),
        ),
        onChanged: (value) {
          context.read<LoginBloc>().add(PasswordChanged(value));
        },
      ),
    ],
  );
}

