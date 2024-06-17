// ignore_for_file: unused_local_variable

import 'package:bhm_app/Core/data/repositories/micuenta_repositoryImpl.dart';
import 'package:bhm_app/Core/domain/usecases/load_miCuenta_data.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_miCuenta/miCuenta_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_miCuenta/miCuenta_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_miCuenta/miCuenta_state.dart';
import 'package:bhm_app/Core/presentation/widgets/PefilUser/fotoPerfil.dart';
import 'package:bhm_app/Core/presentation/widgets/PefilUser/infoPersonal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MiCuentaBloc(LoadMiCuentaData(MiCuentaRepositoryImpl()))
            ..add(LoadMiCuentaDataEvent()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MiCuentaBloc, MiCuentaState>(
            builder: (context, state) {
              TextEditingController nameController = TextEditingController(text: state.numCuenta);
              TextEditingController lastNameController = TextEditingController(text: state.user);
              TextEditingController rfcController = TextEditingController(text: state.cell);
              TextEditingController emailController = TextEditingController(text: state.userEmail);
              TextEditingController fotoPerfilController = TextEditingController(text: state.fotoPerfil);
              return ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  fotoPerfil(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: const Text(
                      'Informacion Personal',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoPersonal('Numero de cuenta', state.numCuenta),
                      infoPersonal('Usuario', state.user),
                      infoPersonal('Email', state.userEmail),
                      infoPersonal('Telefono', state.cell),
                    ],
                  ),
                ],
              );
            }
          )
        )
      )
    );
  }
}
