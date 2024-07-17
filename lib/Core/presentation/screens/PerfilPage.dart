import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_miCuenta/miCuenta_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_miCuenta/miCuenta_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_miCuenta/miCuenta_state.dart';
import 'package:bhm_app/Core/data/repositories/micuenta_repositoryImpl.dart';
import 'package:bhm_app/Core/domain/usecases/load_miCuenta_data.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:bhm_app/Core/presentation/widgets/PefilUser/fotoPerfil.dart';
import 'package:bhm_app/Core/presentation/widgets/PefilUser/infoPersonal.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});
  
  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final Dio dio = Dio();
  final TokenStorage tokenStorage = TokenStorage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MiCuentaBloc(LoadMiCuentaData(MiCuentaRepositoryImpl(dio, tokenStorage)))
        ..add(LoadMiCuentaDataEvent()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MiCuentaBloc, MiCuentaState>(
            builder: (context, state) {
              //print('State data: $state'); // 
              if (state.error.isNotEmpty) {
                return Center(child: Text('Error: ${state.error['error']}'));
              } else {
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
                        infoPersonal(context,'Primer nombre', state.name),
                        infoPersonal(context,'RFC', state.rfc),
                        infoPersonal(context,'Email', state.email),
                        infoPersonal(context,'Telefono', state.phone),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
