import 'package:bhm_app/Core/presentation/screens/DashBoard.dart';
import 'package:bhm_app/Core/presentation/screens/HelpPage.dart';
import 'package:bhm_app/Core/presentation/screens/LoginPage.dart';
import 'package:bhm_app/Core/presentation/screens/Monto.dart';
import 'package:bhm_app/Core/presentation/screens/Movimientos.dart';
import 'package:bhm_app/Core/presentation/screens/PerfilPage.dart';
import 'package:bhm_app/Core/presentation/screens/Services.dart';
import 'package:bhm_app/Core/presentation/screens/TransferScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [DashBoard(), PerfilPage(), HelpPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF16697A),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Movimientos()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: const Color(0xFF16697A),
                    shape: BoxShape.rectangle,
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
                const Text(
                  'Porque solo se vive una vez!',
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 18,
                      color: Color(0xffFF6347)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TransferScreen()));
                  },
                  child: accionesRapidas('Transferir'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Monto()));
                  },
                  child: accionesRapidas('Retirar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Services()));
                  },
                  child: accionesRapidas('Ver servicios'),
                ),
              ]),
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
                ),
              ),
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
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
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
            label: 'Cuenta',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_mark,
              color: Color(0xFF16697A),
            ),
            label: 'Ayuda',
          ),
        ],
      ),
    );
  }
}

Widget accionesRapidas(String accion) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        accion,
        style: const TextStyle(fontSize: 18, color: Color(0xff16697A)),
      ),
      const Icon(Icons.arrow_forward, color: Color(0xff16697A))
    ]),
  );
}
