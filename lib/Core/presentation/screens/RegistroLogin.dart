import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Registro de Login',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: RegisterPage(),
//     );
//   }
// }

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rfcController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _idBankController = TextEditingController();

  bool _isValid = false;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final registro = RegistroLogin(
        name: _nameController.text,
        lastname: _lastnameController.text,
        email: _emailController.text,
        rfc: _rfcController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
        idBank: int.parse(_idBankController.text),
        isValid: _isValid,
      );

      // Aquí puedes procesar la instancia de RegistroLogin según sea necesario
      print('Nombre: ${registro.name}');
      print('Apellido: ${registro.lastname}');
      print('Email: ${registro.email}');
      print('RFC: ${registro.rfc}');
      print('Teléfono: ${registro.phone}');
      print('Contraseña: ${registro.password}');
      print('ID Banco: ${registro.idBank}');
      print('¿Es válido?: ${registro.isValid}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastnameController,
                decoration: const InputDecoration(labelText: 'Apellido'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su apellido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor ingrese un email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rfcController,
                decoration: const InputDecoration(labelText: 'RFC'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su RFC';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su teléfono';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _idBankController,
                decoration: const InputDecoration(labelText: 'ID Banco'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su ID de Banco';
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: const Text('¿Es válido?'),
                value: _isValid,
                onChanged: (bool value) {
                  setState(() {
                    _isValid = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _rfcController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _idBankController.dispose();
    super.dispose();
  }
}

class RegistroLogin {
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  final int idBank;
  final bool isValid;

  RegistroLogin({
    required this.name,
    required this.lastname,
    required this.email,
    required this.rfc,
    required this.phone,
    required this.password,
    required this.idBank,
    required this.isValid,
  });
}
