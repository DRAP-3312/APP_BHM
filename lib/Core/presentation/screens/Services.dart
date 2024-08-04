import 'package:bhm_app/Core/data/repositories/servicio_repositoryImpl.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:bhm_app/Core/presentation/widgets/servicios/pagoServicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_servicio/servicio_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_servicio/servicio_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_servicio/servicio_state.dart';
import 'package:bhm_app/Core/domain/usecases/load_servicio_data.dart';


class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  late final ServicioBloc _servicioBloc;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    final tokenStorage = TokenStorage();
    final servicioRepository = ServicioRepositoryImpl(dio,tokenStorage);
    final loadServicioData = LoadServicioData(servicioRepository);
    _servicioBloc = ServicioBloc(loadServicioData)..add(LoadServicioDataEvent());
  }

  @override
  void dispose() {
    _servicioBloc.close();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [  
             Text(
              'Pago de Servicio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => _servicioBloc,
        child: BlocBuilder<ServicioBloc, ServicioState>(
          builder: (context, state) {
           if (state is ServicioStateInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ServicioStateLoaded) {
              final servicios = state.servicios; 
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: pagoServicio(context, servicios)),
              );
            } else if (state is ServicioStateError) {
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ),
      ),
    );
  }
}