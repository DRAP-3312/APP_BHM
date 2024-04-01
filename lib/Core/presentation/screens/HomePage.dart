import 'package:bhm_app/Core/presentation/screens/ListaTarjetas.dart';
import 'package:bhm_app/Core/presentation/screens/LoginPage.dart';
//import 'package:bhm_app/Core/presentation/screens/PerfilPage.dart';
import 'package:bhm_app/Core/presentation/screens/Services.dart';
import 'package:bhm_app/Core/presentation/widgets/home-view/noticias.dart';
import 'package:bhm_app/Core/presentation/widgets/home-view/otros-servicios.dart';
// import 'package:bhm_app/Core/presentation/screens/Services.dart';
//import 'package:bhm_app/service/notification.service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> Lista1 = ['Transacciones', 'Opcion 1', 'Opcion 2', 'Opcion 3'];
    List<String> Lista2 = ['Servicios', 'Serv 1', 'Serv 2', 'Serv 3'];
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Cambia el color del icono de hamburguesa
          ),
          backgroundColor: const Color(0xFF16697A),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
              //padding: EdgeInsets.zero,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: const Color(0xFF16697A),
                        shape: BoxShape.rectangle, // O BoxShape.circle
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/LogoShort.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Banco Horizonte Mexicano',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                              Text(
                                'BHM@hotmail.com',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors
                            .transparent, // Define el color del divisor aquí
                      ),
                      child: ExpansionTile(
                        backgroundColor: Theme.of(context).canvasColor,
                        title: Text(Lista1[0]),
                        children: <Widget>[
                          // const Divider(color: Colors.white),
                          ListTile(
                            title: Text(Lista1[1]),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Lista1[2]),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Lista1[3]),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors
                            .transparent, // Define el color del divisor aquí
                      ),
                      child: ExpansionTile(
                        backgroundColor: Theme.of(context).canvasColor,
                        title: Text(Lista2[0]),
                        children: <Widget>[
                          //const Divider(color: Colors.white),
                          ListTile(
                            title: Text(Lista2[1]),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Lista2[2]),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(Lista2[3]),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16697A),
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    child: const Text(
                      'Cerrar Sesion',
                      style: TextStyle(fontSize: 15),
                    )),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color(0xFF16697A),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.credit_card,
                  color: Color(0xFF16697A),
                ),
                label: 'Credit card'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Color(0xFF16697A),
                ),
                label: 'Cuenta'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Color(0xFF16697A),
                ),
                label: 'Cofig'),
          ],
          // onTap: (int index) {
          //   // Acción según el índice del elemento seleccionado
          //   if (index == 0) {
          //     Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => const HomePage()));
          //   } else if (index == 2) {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const PerfilPage()));
          //   }
          //   // Agrega más condiciones según la cantidad de elementos en tu BottomNavigationBarItem
          // },
        ),
        body: ListView(
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
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/homeImages/Tarjeta.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Tarjeta de Crédito', // Texto opcional sobre la imagen
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
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
                        title: 'Depositar',
                        icono: Icons.currency_exchange,
                        onTap: () {}),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: ItemService(
                      title: 'Retirar',
                      icono: Icons.payment,
                      onTap: () {},
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
                    title:
                        "Obten hasta un 15% de descuento usando tu aqua card",
                    image: 'assets/images/homeImages/notice.jpg')
              ],
            )
          ],
        ));
  }
}
