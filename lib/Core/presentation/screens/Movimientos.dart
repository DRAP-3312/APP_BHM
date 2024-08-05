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

class _MovimientosState extends State<Movimientos>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late MovimientosBloc _movimientosBloc;
  final TokenStorage tokenStorage = TokenStorage();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _movimientosBloc =
        MovimientosBloc(MovimientosRepositoryImpl(Dio(), tokenStorage))
          ..add(LoadMovimientosEvent());
  }

  @override
  void dispose() {
    _tabController.dispose();
    _movimientosBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimientos recientes'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        backgroundColor: const Color(0xFF16697A),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomePage())),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            color: Colors.white,
            child: TabBar(
              labelColor: const Color(0xffFF6347),
              unselectedLabelColor: const Color(0xFF16697A),
              indicatorColor: const Color(0xffFF6347),
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'SERVICIOS',
                ),
                Tab(text: 'TRANSFERENCIAS'),
              ],
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => _movimientosBloc,
        child: BlocBuilder<MovimientosBloc, MovimientosState>(
          builder: (context, state) {
            if (state is MovimientosLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovimientosLoaded) {
              return TabBarView(
                controller: _tabController,
                children: [
                  listaServicio(state.movimientosData['services']['data']),
                  listaTransfer(state.movimientosData['transfer']['data']),
                ],
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
}

Widget listaServicio(List<dynamic> listservicios) {
  List<dynamic> servicios = listservicios.reversed.toList();
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFFC9C9C9),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: ListView(
      padding: const EdgeInsets.all(10.0),
      children: servicios.map((servicio) {
        return Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ExpansionTile(
            title: titulos('Referencia: ', servicio['reference']),
            subtitle: titulos('Monto: \$',servicio['amount'].toString()),
            children: <Widget>[
              ListTile(
                title: const Text('Detalles del servicio', style: TextStyle(color: Color.fromARGB(255, 114, 114, 114), fontSize: 12),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detalles('ID Servicio: ', servicio['id_service'].toString())
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}

Widget listaTransfer(List<dynamic> listTrans) {
  List<dynamic> transfers = listTrans.reversed.toList();
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFFC9C9C9),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: ListView(
      padding: const EdgeInsets.all(10.0),
      children: transfers.map((transfer) {
        return Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ExpansionTile(
            title: titulos('Concepto: ',transfer['concept'] != null && transfer['concept'].toString().isNotEmpty ? transfer['concept'] : 'desconocido'),
            subtitle: titulos('Monto: \$', transfer['amount'] != null && transfer['amount'].toString().isNotEmpty ? transfer['amount'].toString() : 'desconocido'),         
            children: <Widget>[
              ListTile(
                title: const Text('Detalles de la transferencia', style: TextStyle(color: Color.fromARGB(255, 114, 114, 114), fontSize: 12)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detalles('Propietario: ', transfer['owner'] != null && transfer['owner'].toString().isNotEmpty ? transfer['owner'] : 'desconocido'),
                    detalles('Mi card: ', transfer['sender_account'].toString()),
                    detalles('Card receptor: ', transfer['receptor_account'].toString())
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}

Widget detalles(String titulo, String data) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: titulo,
            style: const TextStyle(
              color: Color(0xffFF6347)
            )),
        TextSpan(
          text: data,
          style: const TextStyle(color: Colors.black)
        ),
      ],
    ),
  );
}


Widget titulos(String titulo, String data) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color:  Color(0xFF16697A)
            )),
        TextSpan(
          text: data,
          style: const TextStyle(color: Colors.black)
        ),
      ],
    ),
  );
}
