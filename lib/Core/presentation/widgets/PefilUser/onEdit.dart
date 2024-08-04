import 'package:bhm_app/Core/presentation/widgets/servicios/singIn.dart';
import 'package:flutter/material.dart';
import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/data/repositories/micuenta_repositoryImpl.dart';
import 'package:dio/dio.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';

class EditUser extends StatefulWidget {
  final Micuenta user;

  const EditUser({super.key, required this.user});

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
      );

      try {
        await _miCuentaRepository.updateUserData(updatedUser);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Datos actualizados con éxito'),
          ));
          Navigator.pop(context, updatedUser);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Error al actualizar los datos'),
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),
        titleTextStyle: const TextStyle(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Editar datos',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF16697A),
                      fontSize: 25),
                ),
              ),
              _buildTextFormField(
                controller: _accountController,
                labelText: 'Primer Nombre',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _usernameController,
                labelText: 'Usuario',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre de usuario';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _emailController,
                labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el email';
                  }
                  return null;
                },
              ),
              _buildTextFormField(
                controller: _phoneController,
                labelText: 'Teléfono',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el número de teléfono';
                  }
                  return null;
                },
              ),
             const SizedBox(height: 20),
               SignIn(
                onTap: _updateUserData,
               )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Color(0xFF16697A)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xffFF6347),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
