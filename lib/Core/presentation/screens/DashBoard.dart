import 'package:bhm_app/Core/data/repositories/inicio_repositoryImpl.dart';
import 'package:bhm_app/Core/domain/usecases/load_inicio_data.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_inicio/inicio_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_inicio/inicio_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_inicio/inicio_state.dart';
import 'package:bhm_app/Core/presentation/screens/ListaTarjetas.dart';
import 'package:bhm_app/Core/presentation/screens/Monto.dart';
import 'package:bhm_app/Core/presentation/screens/Services.dart';
import 'package:bhm_app/Core/presentation/screens/TransferScreen.dart';
import 'package:bhm_app/Core/presentation/widgets/home-view/noticias.dart';
import 'package:bhm_app/Core/presentation/widgets/home-view/otros-servicios.dart';
import 'package:bhm_app/Core/presentation/widgets/tarjetaCambio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InicioBloc(LoadInicioData(InicioRepositoryImpl()))
        ..add(LoadInicioDataEvent()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<InicioBloc, InicioState>(
          builder: (context, state) {
            TextEditingController userNameController =
                TextEditingController(text: state.userName);
            TextEditingController numTarjetController =
                TextEditingController(text: state.numTarjet);
            TextEditingController newsController =
                TextEditingController(text: state.news);
            TextEditingController fotoUserController =
                TextEditingController(text: state.fotoNews);
            TextEditingController fotoNews =
                TextEditingController(text: state.fotoNews);
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff16697A),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      ListTile(
                        title: Text('Buenos días',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(state.userName,
                            style: TextStyle(
                              color: Color(0xffEDE7E3),
                              fontSize: 15,
                            )),
                        trailing: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/personita.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListaTarjetas()));
                  },
                  child: const FlipImageWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: ItemService(
                            title: 'Servicios',
                            icono: Icons.design_services,
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Services()));
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: ItemService(
                            title: 'Transferir',
                            icono: Icons.currency_exchange,
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TransferScreen()));
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: ItemService(
                          title: 'Retirar',
                          icono: Icons.payment,
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Monto()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text(
                    '  Noticias',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                 Column(
                  children: [
                    ItemsNewsFeed(
                        title:
                            state.news,
                        image: 'assets/images/homeImages/notice.jpg')
                  ],
                )
              ],
            );
          },
        )),
      ),
    );
  }
}
