import 'package:bhm_app/Core/data/repositories/cuenta_respositoryImpl.dart';
import 'package:bhm_app/Core/domain/usecases/load_contacto_data.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_state.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:bhm_app/Core/presentation/widgets/contactos/vistaCreateContacto.dart';
import 'package:bhm_app/Core/presentation/widgets/servicios/pagoTransfer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_event.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  late final ContactoBloc _contactoBloc;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    final tokenStorage = TokenStorage();
    final servicioRepository = CuentaRepositoryImpl(dio, tokenStorage);
    final loadContactoData = LoadContactoData(servicioRepository);
    _contactoBloc = ContactoBloc(loadContactoData, servicioRepository)
      ..add(LoadContactoDataEvent());
  }

  @override
  void dispose() {
    _contactoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mis Contactos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => _contactoBloc,
        child: BlocBuilder<ContactoBloc, ContactoState>(
          builder: (context, state) {
            if (state is ContactoStateInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ContactoStateLoaded) {
              final contacto = state.contacto;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Container(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          onPressed: () {
                            final contactoBloc =
                                BlocProvider.of<ContactoBloc>(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateContactScreen(
                                    contactoBloc: contactoBloc),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nuevo',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: pagoTransfer(context, contacto),
                  ),
                ],
              );
            } else if (state is ContactoStateError) {
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
