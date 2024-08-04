import 'package:bhm_app/Core/data/repositories/RegistroLogin_respositorylmpl.dart';
import 'package:bhm_app/Core/domain/usecases/load_RegistroLogin_data.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_state.dart';
import 'package:bhm_app/Core/presentation/widgets/servicios/singIn.dart';
import 'package:bhm_app/service/my_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistroLogin extends StatefulWidget {
  const RegistroLogin({super.key});

  @override
  State<RegistroLogin> createState() => _RegistroLoginState();
}

class _RegistroLoginState extends State<RegistroLogin> {
  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController rfcController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController idBankController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    rfcController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    idBankController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    rfcController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    idBankController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistroLoginBloc(
        LoadRegistroDataData(RegistroLoginRepositoryImpl(dio: Dio())),
        RegistroLoginRepositoryImpl(dio: Dio()),
      )..add(LoadRegistroLoginDataEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: BlocListener<RegistroLoginBloc, RegistroLoginState>(
            listener: (context, state) {
              if (state.errors['submission'] != null &&
                  state.errors['submission']!.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Registro incorrecto, intentelo de nuevo, mas tarde'),
                    duration:  Duration(seconds: 2),
                  ),
                );
              }
              if (state is RegistroLoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Registro exitoso!'),
                    duration:  Duration(seconds: 3),
                  ),
                );
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15.0),
              child: BlocBuilder<RegistroLoginBloc, RegistroLoginState>(
                builder: (context, state) {
                  // Actualización de controladores de texto
                  if (nameController.text != state.name) {
                    nameController.text = state.name;
                    nameController.selection = TextSelection.fromPosition(
                      TextPosition(offset: nameController.text.length),
                    );
                  }
                  if (lastNameController.text != state.lastname) {
                    lastNameController.text = state.lastname;
                    lastNameController.selection = TextSelection.fromPosition(
                      TextPosition(offset: lastNameController.text.length),
                    );
                  }
                  if (emailController.text != state.email) {
                    emailController.text = state.email;
                    emailController.selection = TextSelection.fromPosition(
                      TextPosition(offset: emailController.text.length),
                    );
                  }
                  if (rfcController.text != state.rfc) {
                    rfcController.text = state.rfc;
                    rfcController.selection = TextSelection.fromPosition(
                      TextPosition(offset: rfcController.text.length),
                    );
                  }
                  if (phoneController.text != state.phone) {
                    phoneController.text = state.phone;
                    phoneController.selection = TextSelection.fromPosition(
                      TextPosition(offset: phoneController.text.length),
                    );
                  }
                  if (passwordController.text != state.password) {
                    passwordController.text = state.password;
                    passwordController.selection = TextSelection.fromPosition(
                      TextPosition(offset: passwordController.text.length),
                    );
                  }
                  if (idBankController.text != state.id_banck.toString()) {
                    idBankController.text = state.id_banck.toString();
                    idBankController.selection = TextSelection.fromPosition(
                      TextPosition(offset: idBankController.text.length),
                    );
                  }

                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      Image.asset(
                        'assets/images/Bienvenida.jpg',
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Comienza tu Aventura con BHM',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Arial Black',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF16697A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        context,
                        'Nombre completo',
                        nameController,
                        (value) => context
                            .read<RegistroLoginBloc>()
                            .add(NameChanged(value)),
                      ),
                      if (state.errors['name'] != null)
                        Text(
                          state.errors['name']!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 19),
                      _buildTextField(
                        context,
                        'Apellido',
                        lastNameController,
                        (value) => context
                            .read<RegistroLoginBloc>()
                            .add(LastNameChanged(value)),
                      ),
                      if (state.errors['lastname'] != null)
                        Text(
                          state.errors['lastname']!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 19),
                      _buildTextField(
                        context,
                        'Correo',
                        emailController,
                        (value) => context
                            .read<RegistroLoginBloc>()
                            .add(EmailChanged(value)),
                      ),
                      if (state.errors['email'] != null)
                        Text(
                          state.errors['email']!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 19),
                      _buildTextField(
                        context,
                        'RFC',
                        rfcController,
                        (value) => context
                            .read<RegistroLoginBloc>()
                            .add(RfcChanged(value)),
                      ),
                      if (state.errors['rfc'] != null)
                        Text(
                          state.errors['rfc']!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 19),
                      _buildTextField(
                        context,
                        'Teléfono',
                        phoneController,
                        (value) => context
                            .read<RegistroLoginBloc>()
                            .add(PhoneChanged(value)),
                      ),
                      if (state.errors['phone'] != null)
                        Text(
                          state.errors['phone']!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 19),
                      _buildTextField(
                        context,
                        'Contraseña',
                        passwordController,
                        (value) => context
                            .read<RegistroLoginBloc>()
                            .add(PassowordChanged(value)),
                        obscureText: true,
                      ),
                      if (state.errors['password'] != null)
                        Text(
                          state.errors['password']!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 32),
                      _buildTextField(
                        context,
                        'ID Bank',
                        idBankController,
                        (value) => context
                            .read<RegistroLoginBloc>()
                            .add(IdbanckChanged(int.tryParse(value) ?? 0)),
                      ),
                      if (state.errors['id_banck'] != null)
                        Text(
                          state.errors['id_banck']!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 19),
                      SignIn(onTap: () {
                        if (state.isValid) {
                          context
                              .read<RegistroLoginBloc>()
                              .add(RegistroLoginSubmitted());
                          nameController.clear();
                          lastNameController.clear();
                          emailController.clear();
                          rfcController.clear();
                          phoneController.clear();
                          passwordController.clear();
                          idBankController.clear();
                        } else {
                          List<String> errorMessages = [];

                          if (state.errors['name'] != null &&
                              state.errors['name']!.isNotEmpty) {
                            errorMessages
                                .add('Nombre: ${state.errors['name']}');
                          }
                          if (state.errors['lastname'] != null &&
                              state.errors['lastname']!.isNotEmpty) {
                            errorMessages
                                .add('Apellido: ${state.errors['lastname']}');
                          }
                          if (state.errors['email'] != null &&
                              state.errors['email']!.isNotEmpty) {
                            errorMessages
                                .add('Correo: ${state.errors['email']}');
                          }
                          if (state.errors['rfc'] != null &&
                              state.errors['rfc']!.isNotEmpty) {
                            errorMessages.add('RFC: ${state.errors['rfc']}');
                          }
                          if (state.errors['phone'] != null &&
                              state.errors['phone']!.isNotEmpty) {
                            errorMessages
                                .add('Teléfono: ${state.errors['phone']}');
                          }
                          if (state.errors['password'] != null &&
                              state.errors['password']!.isNotEmpty) {
                            errorMessages
                                .add('Contraseña: ${state.errors['password']}');
                          }
                          if (state.errors['id_banck'] != null &&
                              state.errors['id_banck']!.isNotEmpty) {
                            errorMessages
                                .add('ID Banco: ${state.errors['id_banck']}');
                          }
                          // if (state.errors['submission'] != null && state.errors['submission']!.isNotEmpty) {
                          //   errorMessages.add(state.errors['submission']!);
                          // }

                          final errorMessage = errorMessages.join('\n');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage.isNotEmpty
                                  ? errorMessage
                                  : 'Por favor complete todos los campos correctamente'),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        }
                      }),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String labelText,
      TextEditingController controller, Function(String) onChanged,
      {bool obscureText = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            labelText,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        MyTextFormField(
          controller: controller,
          hintText: 'Ingrese su $labelText',
          obscureText: obscureText,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
