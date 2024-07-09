// import 'package:bhm_app/Core/data/repositories/RegistroLogin_respositorylmpl.dart';
// import 'package:bhm_app/Core/domain/usecases/load_RegistroLogin_data.dart';
// import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_bloc.dart';
// import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_event.dart';
// import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_state.dart';
// import 'package:bhm_app/Core/presentation/widgets/servicios/singIn.dart';
// import 'package:bhm_app/service/my_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class RegistroLogin extends StatefulWidget {
//   const RegistroLogin({super.key});

//   @override
//   State<RegistroLogin> createState() => _RegistroLoginState();
// }

// class _RegistroLoginState extends State<RegistroLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           RegistroLoginBloc(LoadRegistroDataData(RegistroLoginRepositoryImpl()))
//             ..add(LoadRegistroLoginDataEvent()),
//       child: Scaffold(
//         body: SafeArea(
//           child: SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//             child: SingleChildScrollView(
//               child: BlocBuilder<RegistroLoginBloc, RegistroLoginState>(
//                 builder: (context, state) {
//                   // Verificar estado actual
//                   print('Estado actual en la vista: $state');

//                   TextEditingController nameController = TextEditingController(text: state.name);
//                   TextEditingController lastNameController = TextEditingController(text: state.lastname);
//                   TextEditingController emailController = TextEditingController(text: state.email);
//                   TextEditingController rfcController = TextEditingController(text: state.rfc);
//                   TextEditingController phoneController = TextEditingController(text: state.phone);
//                   TextEditingController passwordController = TextEditingController(text: state.password);
//                   TextEditingController idBankController = TextEditingController(text: state.id_banck.toString());

//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 50),
//                       const Text(
//                         'Registro',
//                         style: TextStyle(
//                           fontSize: 48,
//                           fontFamily: 'Arial Black',
//                           fontWeight: FontWeight.bold
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 66),

//                       // Nombre completo
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Nombre completo',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       MyTextFormField(
//                         controller: nameController,
//                         hintText: 'Ingrese su nombre',
//                         obscureText: false,
//                       ),
//                       const SizedBox(height: 19),
//                       // Telefono

//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Telefono',
//                               style: TextStyle(
//                                 // color: GlobalColors.color11.withOpacity(.75),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       MyTextFormField(
//                         controller: lastNameController,
//                         hintText: 'Ingrese su apellido',
//                         obscureText: false,
//                       ),
//                       const SizedBox(height: 19),

//                       // Usuario
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Usuario',
//                               style: TextStyle(
//                                 // color: GlobalColors.color11.withOpacity(.75),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       MyTextFormField(
//                         controller: emailController,
//                         hintText: 'Ingrese su correo',
//                         obscureText: false,
//                       ),

//                       // RFC
//                       const SizedBox(height: 19),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'RFC',
//                               style: TextStyle(
//                                 // color: GlobalColors.color11.withOpacity(.75),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       MyTextFormField(
//                         controller: rfcController,
//                         hintText: 'Ingrese su RFC',
//                         obscureText: false,
//                       ),
//                       const SizedBox(height: 19),
//                       // Correo
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Correo',
//                               style: TextStyle(
//                                 // color: GlobalColors.color11.withOpacity(.75),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       MyTextFormField(
//                         controller: phoneController,
//                         hintText: 'Ingrese su telefono personal',
//                         obscureText: false,
//                       ),
//                       const SizedBox(height: 19),
//                       // Contraseña
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Contraseña',
//                               style: TextStyle(
//                                 // color: GlobalColors.color11.withOpacity(.75),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       MyTextFormField(
//                         controller: passwordController,
//                         hintText: 'Ingrese su contraseña',
//                         obscureText: true,
//                       ),
//                       const SizedBox(height: 32),

//                       const SizedBox(height: 19),
//                       MyTextFormField(
//                         controller: idBankController,
//                         hintText: 'Ingrese su idbanck',
//                         obscureText: false,
//                       ),
//                       const SizedBox(height: 19),
//                       SignIn(onTap: () {
//                         if (state.isValid) {
//                           context.read<RegistroLoginBloc>().add(RegistroLoginSubmitted());
//                           //context.go('/');
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Por favor complete todos los campos')),
//                           );
//                         }
//                       })
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



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
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
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
                    // Verificar estado actual
                    print('Estado actual en la vista: $state');

                    TextEditingController nameController = TextEditingController(text: state.name);
                    TextEditingController lastNameController = TextEditingController(text: state.lastname);
                    TextEditingController emailController = TextEditingController(text: state.email);
                    TextEditingController rfcController = TextEditingController(text: state.rfc);
                    TextEditingController phoneController = TextEditingController(text: state.phone);
                    TextEditingController passwordController = TextEditingController(text: state.password);
                    TextEditingController idBankController = TextEditingController(text: state.id_banck.toString());

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        const Text(
                          'Registro',
                          style: TextStyle(
                            fontSize: 48,
                            fontFamily: 'Arial Black',
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 66),

                        // Nombre completo
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Nombre completo',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        MyTextFormField(
                          controller: nameController,
                          hintText: 'Ingrese su nombre',
                          obscureText: false,
                          onChanged: (value) {
                            context.read<RegistroLoginBloc>().add(NameChanged(value));
                          },
                        ),
                        const SizedBox(height: 19),
                        // Apellido

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Apellido',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        MyTextFormField(
                          controller: lastNameController,
                          hintText: 'Ingrese su apellido',
                          obscureText: false,
                          onChanged: (value) {
                            context.read<RegistroLoginBloc>().add(LastNameChanged(value));
                          },
                        ),
                        const SizedBox(height: 19),

                        // Correo
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Correo',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        MyTextFormField(
                          controller: emailController,
                          hintText: 'Ingrese su correo',
                          obscureText: false,
                          onChanged: (value) {
                            context.read<RegistroLoginBloc>().add(EmailChanged(value));
                          },
                        ),

                        // RFC
                        const SizedBox(height: 19),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'RFC',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        MyTextFormField(
                          controller: rfcController,
                          hintText: 'Ingrese su RFC',
                          obscureText: false,
                          onChanged: (value) {
                            context.read<RegistroLoginBloc>().add(RfcChanged(value));
                          },
                        ),
                        const SizedBox(height: 19),
                        // Teléfono
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Teléfono',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        MyTextFormField(
                          controller: phoneController,
                          hintText: 'Ingrese su teléfono personal',
                          obscureText: false,
                          onChanged: (value) {
                            context.read<RegistroLoginBloc>().add(PhoneChanged(value));
                          },
                        ),
                        const SizedBox(height: 19),
                        // Contraseña
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Contraseña',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        MyTextFormField(
                          controller: passwordController,
                          hintText: 'Ingrese su contraseña',
                          obscureText: true,
                          onChanged: (value) {
                            context.read<RegistroLoginBloc>().add(PassowordChanged(value));
                          },
                        ),
                        const SizedBox(height: 32),

                        // Id Bank
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'ID Bank',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MyTextFormField(
                          controller: idBankController,
                          hintText: 'Ingrese su idbanck',
                          obscureText: false,
                          onChanged: (value) {
                            context.read<RegistroLoginBloc>().add(IdbanckChanged(int.tryParse(value) ?? 0));
                          },
                        ),
                        const SizedBox(height: 19),
                        SignIn(onTap: () {
                          if (state.isValid) {
                            context.read<RegistroLoginBloc>().add(RegistroLoginSubmitted());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Por favor complete todos los campos')),
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
}
