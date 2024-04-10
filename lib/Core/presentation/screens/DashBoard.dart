import 'package:bhm_app/Core/presentation/screens/ListaTarjetas.dart';
import 'package:bhm_app/Core/presentation/screens/Monto.dart';
import 'package:bhm_app/Core/presentation/screens/Services.dart';
import 'package:bhm_app/Core/presentation/screens/TransferScreen.dart';
import 'package:bhm_app/Core/presentation/widgets/home-view/noticias.dart';
import 'package:bhm_app/Core/presentation/widgets/home-view/otros-servicios.dart';
import 'package:bhm_app/Core/presentation/widgets/tarjetaCambio.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xff16697A),
          ),
          child: const Column(
            children: [
              SizedBox(height: 10),
              ListTile(
                title: Text('Buenos días',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                subtitle: Text('Yoshua Raymundo Moreno Arendondo',
                    style: TextStyle(
                      color: Color(0xffEDE7E3),
                      fontSize: 15,
                    )),
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/personita.png'),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ListaTarjetas()));
          },
          child: const FlipImageWidget(),
          // child: Container(
          //   margin: const EdgeInsets.all(20),
          //   height: 200,
          //   width: 200,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     image: const DecorationImage(
          //       image: AssetImage('assets/images/homeImages/Tarjeta.jpg'),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          //   child: const Center(
          //     child: Text(
          //       'Tarjeta de Crédito', // Texto opcional sobre la imagen
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
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
                              builder: (context) => const TransferScreen()));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: ItemService(
                  title: 'Retirar',
                  icono: Icons.payment,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Monto()));
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
        const Column(
          children: [
            ItemsNewsFeed(
                title: "Obten hasta un 15% de descuento usando tu aqua card",
                image: 'assets/images/homeImages/notice.jpg')
          ],
        )
      ],
    );
  }
}
