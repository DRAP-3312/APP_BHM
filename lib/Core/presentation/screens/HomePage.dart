import 'package:bhm_app/Core/presentation/screens/DashBoard.dart';
import 'package:bhm_app/Core/presentation/screens/HelpPage.dart';
import 'package:bhm_app/Core/presentation/screens/LoginPage.dart';
import 'package:bhm_app/Core/presentation/screens/PerfilPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<String> lista1 = ['Transacciones', 'Opcion 1', 'Opcion 2', 'Opcion 3'];
  List<String> lista2 = ['Servicios', 'Serv 1', 'Serv 2', 'Serv 3'];
  final List<Widget> _pages = const [DashBoard(), PerfilPage(), HelpPage()];
  @override
  Widget build(BuildContext context) {
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
                        title: Text(lista1[0]),
                        children: <Widget>[
                          // const Divider(color: Colors.white),
                          ListTile(
                            title: Text(lista1[1]),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(lista1[2]),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(lista1[3]),
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
                        title: Text(lista2[0]),
                        children: <Widget>[
                          //const Divider(color: Colors.white),
                          ListTile(
                            title: Text(lista2[1]),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(lista2[2]),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(lista2[3]),
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
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          //fixedColor: const Color(0xffFF6347),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          //unselectedItemColor: Colors.black,
          selectedItemColor: const Color(0xffFF6347),
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
                  Icons.person,
                  color: Color(0xFF16697A),
                ),
                label: 'Cuenta'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.question_mark,
                  color: Color(0xFF16697A),
                ),
                label: 'Ayuda'),
          ],
        ));
  }
}
