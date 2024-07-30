import 'package:flutter/material.dart';
import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_event.dart';

class CreateContactScreen extends StatefulWidget {
  final ContactoBloc contactoBloc;

  const CreateContactScreen({Key? key, required this.contactoBloc})
      : super(key: key);

  @override
  _CreateContactScreenState createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idUserController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _banknameController = TextEditingController();

  @override
  void dispose() {
    _idUserController.dispose();
    _nicknameController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final newContacto = Cuenta(
          id_user: int.parse(_idUserController.text),
          nickname: _nicknameController.text,
          account: _accountController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          bankname: _banknameController.text);

      try {
        widget.contactoBloc.add(CreateContactoEvent(newContacto));
        Navigator.of(context).pop();
      } catch (e) {
        throw Exception('Error al crear el contacto: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agregar Contacto',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF16697A),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _buildTextFormField(
                  controller: _idUserController,
                  labelText: 'Id user',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un id';
                    }
                    return null;
                  }),
              const SizedBox(height: 16),
              _buildTextFormField(
                  controller: _nicknameController,
                  labelText: 'Nickname',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Debe agregar un nickname';
                    }
                    return null;
                  }),
              const SizedBox(height: 16),
              _buildTextFormField(
                  controller: _accountController,
                  labelText: 'Account',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Account no puede ir vacio';
                    }
                    return null;
                  }),
              const SizedBox(height: 16),
              _buildTextFormField(
                  controller: _emailController,
                  labelText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email no puede ir vacio';
                    }
                    return null;
                  }),
              const SizedBox(height: 16),
              _buildTextFormField(
                  controller: _phoneController,
                  labelText: 'Phone',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone no puede ir vacio';
                    }
                    return null;
                  }),
              const SizedBox(height: 16),
              _buildTextFormField(
                  controller: _banknameController,
                  labelText: 'Bankname',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bankname no puede ir vacio';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF16697A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'Guardar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //backgroundColor: const Color(0xFFEFEFEF),
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
