import 'package:bhm_app/Core/presentation/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  bool _ifChecked = false;
  String phoneNumber = "";
  String password = "";
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        loginInputs(phoneNumber, password, togglePasswordView),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: _ifChecked,
              onChanged: (newValue) => {setState(() => _ifChecked = newValue!)},
            ),
            const Text('Matener Sesion'),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          
          onPressed: () {
            auth();
            // Navigator.pushReplacement(context,
            // MaterialPageRoute(builder: (context) => const HomePage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF16697A),
            foregroundColor: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
          
          child: const Text(
            'INGRESAR',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        IconButton(
            onPressed: () {
              auth();
            },
            color:const Color(0xffFFB997),
            icon: const Icon(
              Icons.fingerprint,
              size: 50, color: Color(0xffFF6347),
            ))
      ],
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

Widget loginInputs(
    String email, String password, VoidCallback togglePasswordView) {
  return Column(
    crossAxisAlignment:
        CrossAxisAlignment.start, // Alinea los textos a la izquierda.
    children: [
      TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: 'USUARIO',
          hintText: 'Nombre de usuario o correo',
        ),
        controller: TextEditingController(text: email),
      ),
      const SizedBox(height: 8),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'CONTRASEÑA',
          hintText: 'Ingresa tu contraseña',
          suffixIcon: IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: (){},
          ),
        ),
        controller: TextEditingController(text: password),
      ),
    ],
  );
}
