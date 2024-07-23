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
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: BlocListener<RegistroLoginBloc, RegistroLoginState>(
                listener: (context, state) {
                  if (state is RegistroLoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registro exitoso')),
                    );
                  } else if (state is RegistroLoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error en el registro')),
                    );
                  }
                },
                child: BlocBuilder<RegistroLoginBloc, RegistroLoginState>(
                  builder: (context, state) {
                    TextEditingController nameController =
                        TextEditingController(text: state.name);
                    TextEditingController lastNameController =
                        TextEditingController(text: state.lastname);
                    TextEditingController emailController =
                        TextEditingController(text: state.email);
                    TextEditingController rfcController =
                        TextEditingController(text: state.rfc);
                    TextEditingController phoneController =
                        TextEditingController(text: state.phone);
                    TextEditingController passwordController =
                        TextEditingController(text: state.password);
                    TextEditingController idBankController =
                        TextEditingController(text: state.id_banck.toString());

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        const SizedBox(height: 19),
                        _buildTextField(
                          context,
                          'Apellido',
                          lastNameController,
                          (value) => context
                              .read<RegistroLoginBloc>()
                              .add(LastNameChanged(value)),
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
                        const SizedBox(height: 19),
                        _buildTextField(
                          context,
                          'RFC',
                          rfcController,
                          (value) => context
                              .read<RegistroLoginBloc>()
                              .add(RfcChanged(value)),
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
                        const SizedBox(height: 32),
                        _buildTextField(
                          context,
                          'ID Bank',
                          idBankController,
                          (value) => context
                              .read<RegistroLoginBloc>()
                              .add(IdbanckChanged(int.tryParse(value) ?? 0)),
                        ),
                        const SizedBox(height: 19),
                        SignIn(onTap: () {
                          if (state.isValid) {
                            context
                                .read<RegistroLoginBloc>()
                                .add(RegistroLoginSubmitted());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Por favor complete todos los campos')),
                            );
                          }
                        })
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String labelText,
      TextEditingController controller, Function(String) onChanged,
      {bool obscureText = false , TextInputType keyboardType = TextInputType.text}) {
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
              fontWeight: FontWeight.w400
            ),
          ),
        ),
        MyTextFormField(
          controller: controller,
          hintText: 'Ingrese su $labelText',
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
