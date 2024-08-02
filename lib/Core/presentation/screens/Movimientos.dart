import 'package:bhm_app/Core/data/repositories/movimientos_repositoryImpl.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_movimientos/movimientos_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_movimientos/movimientos_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_movimientos/movimientos_state.dart';
import 'package:bhm_app/Core/presentation/screens/HomePage.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class Movimientos extends StatefulWidget {
  const Movimientos({Key? key}) : super(key: key);

  @override
  _MovimientosState createState() => _MovimientosState();
}

class _MovimientosState extends State<Movimientos> {
  late MovimientosBloc _movimientosBloc;
  final TokenStorage tokenStorage = TokenStorage();

  @override
  void initState() {
    super.initState();
    _movimientosBloc =
        MovimientosBloc(MovimientosRepositoryImpl(Dio(), tokenStorage))
          ..add(LoadMovimientosEvent());
  }

  @override
  void dispose() {
    _movimientosBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimientos recientes'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: const Color(0xFF16697A),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomePage())),
        ),
      ),
      body: BlocProvider(
        create: (_) => _movimientosBloc,
        child: BlocBuilder<MovimientosBloc, MovimientosState>(
          builder: (context, state) {
            if (state is MovimientosLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovimientosLoaded) {
              return ListView(
                children: _buildMovimientosList(
                    state.movimientosData), // Uso de datos dinámicos.
              );
            } else if (state is MovimientosError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('No hay movimientos disponibles'));
          },
        ),
      ),
    );
  }

  List<Widget> _buildMovimientosList(dynamic data) {
    List<Widget> listItems = [];
    if (data is Map<String, dynamic>) {
      var servicios = data['services'];
      var transferencias = data['transfer'];

      listItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Pagos por servicios',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFF6347)),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              constraints: const BoxConstraints(
                minHeight: 10, 
                maxHeight: 400, 
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFC9C9C9),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: ListView(
                children: [
                  listaServicio(servicios['data']),
                ],
              ),
            ),
          ],
        ),
      ));

      listItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Pagos por transferencia',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFF6347)),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              constraints: const BoxConstraints(
                minHeight: 10, 
                maxHeight: 400, 
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFC9C9C9),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: ListView(
                children: [
                  listaTransfer(transferencias['data']),
                ],
              ),
            ),
          ],
        ),
      ));
    }
    return listItems;
  }
}

Widget listaServicio(List<dynamic> servicios) {
  return Column(
    children: servicios.map((servicio) {
      return Card(
        elevation: 0,
        margin: const EdgeInsets.all(10),
        child: ExpansionTile(
          title: Text('Referencia: ${servicio['reference']}'),
          subtitle: Text('Monto: \$${servicio['amount']}'),
          children: <Widget>[
            ListTile(
              title: const Text('Detalles del servicio'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID Usuario: ${servicio['id_users']}'),
                  Text('ID Cuenta: ${servicio['id_account']}'),
                  Text('ID Servicio: ${servicio['id_service']}'),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}

Widget listaTransfer(List<dynamic> transfers) {
  return Column(
    children: transfers.map((transfer) {
      return Card(
        elevation: 0,
        margin: const EdgeInsets.all(10),
        child: ExpansionTile(
          title: Text(
              'Concepto: ${transfer['concept'] != null && transfer['concept'].toString().isNotEmpty ? transfer['concept'] : 'desconocido'}'),
          subtitle: Text(
              'Monto: \$${transfer['amount'] != null && transfer['amount'].toString().isNotEmpty ? transfer['amount'] : 'desconocido'}'),
          children: <Widget>[
            ListTile(
              title: const Text('Detalles de la transferencia'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Propietario: ${transfer['owner'] != null && transfer['owner'].toString().isNotEmpty ? transfer['owner'] : 'desconocido'}'),
                  Text('ID Usuario: ${transfer['user_account']}'),
                  Text('ID Cuenta: ${transfer['receptor_account']}'),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
