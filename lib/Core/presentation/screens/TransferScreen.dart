import 'package:bhm_app/Core/data/repositories/cuenta_respositoryImpl.dart';
import 'package:bhm_app/Core/domain/usecases/load_contacto_data.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_state.dart';
import 'package:bhm_app/Core/presentation/screens/HomePage.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const Text(
              'Mis Contactos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Container(),
            Container()
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
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.orange,
                            size: 30,
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
