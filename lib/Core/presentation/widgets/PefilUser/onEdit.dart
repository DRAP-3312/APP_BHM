import 'package:flutter/material.dart';
import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/data/repositories/micuenta_repositoryImpl.dart';
import 'package:dio/dio.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';

class EditUser extends StatefulWidget {
  final Micuenta user;

  EditUser({required this.user});

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _accountController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late MiCuentaRepositoryImpl _miCuentaRepository;

  @override
  void initState() {
    super.initState();
    _accountController = TextEditingController(text: widget.user.name);
    _usernameController = TextEditingController(text: widget.user.lastname);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
    _miCuentaRepository = MiCuentaRepositoryImpl(Dio(), TokenStorage());
  }

  @override
  void dispose() {
    _accountController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _updateUserData() async {
    if (_formKey.currentState!.validate()) {
      final updatedUser = Micuenta(
        id: widget.user.id,
        name: _accountController.text,
        lastname: _usernameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        rfc: widget.user.rfc,
        password: widget.user.password,
        id_bank: widget.user.id_bank,
        isValid: widget.user.isValid,
      );

      try {
        await _miCuentaRepository.updateUserData(updatedUser);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Datos actualizados con éxito'),
        ));
        Navigator.pop(context, updatedUser);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al actualizar los datos'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _accountController,
                decoration: InputDecoration(labelText: 'Número de cuenta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el número de cuenta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre de usuario';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Teléfono'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el número de teléfono';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateUserData,
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}