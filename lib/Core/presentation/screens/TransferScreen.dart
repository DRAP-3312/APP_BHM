import 'package:bhm_app/Core/presentation/screens/HomePage.dart';
import 'package:bhm_app/Core/presentation/screens/PantallaTransferencia.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  // Lista estática de contactos
  static List<Contacto> listaContactos = [
    Contacto(nombre: 'Samuel Roman', subtitulo: 'Amigo', icono: Icons.child_care),
    Contacto(nombre: 'Alejandro Chi',subtitulo: 'Compañera de trabajo',icono: Icons.face),
    Contacto(nombre: 'Fernando Flores', subtitulo: 'Conocido', icono: Icons.face_6),
    Contacto(nombre: 'Alejandro Perez', subtitulo: 'Vecino', icono: Icons.face),
    Contacto(nombre: 'David Ake',subtitulo: 'Compañero de estudio',icono: Icons.sentiment_neutral_rounded),
    Contacto(nombre: 'Brandon Lopez',subtitulo: 'Intimo amigo',icono: Icons.face),
    Contacto(nombre: 'Marco Dzidz', subtitulo: 'Companero', icono: Icons.face_5),
    Contacto(nombre: 'Joshua Canche', subtitulo: 'Familiar', icono: Icons.face_4),
    Contacto(nombre: 'Rocio Felix', subtitulo: 'Amiga', icono: Icons.face_3),
    Contacto(nombre: 'Alberto Fuentes',subtitulo: 'Amigo de juego',icono: Icons.mood),
    Contacto(nombre: 'Diego Bermudez', subtitulo: 'Sutidor', icono: Icons.sentiment_very_satisfied),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),
        title: const Text(
          'Transferencias',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        leading: ElevatedButton(
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
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  height: 60,
                  width: 320,
                  child: Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Número de Tarjeta o Contacto',
                        hintStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xffFF6347),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_add,
                      color: Color(0xffFF6347),
                      size: 30,
                    )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listaContactos.length,
              itemBuilder: (context, index) {
                Contacto contacto = listaContactos[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xffEDE7E3),
                    child: Icon(contacto.icono, color: const Color(0xff16697A), size: 35,), // Icono del contacto
                  ),
                  title: Text(
                    contacto.nombre,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    contacto.subtitulo,
                    style: const TextStyle(fontWeight: FontWeight.w200),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xff16697A),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PantallaTransferencia()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Contacto {
  final String nombre;
  final String subtitulo;
  final IconData icono;

  Contacto({
    required this.nombre,
    required this.subtitulo,
    required this.icono,
  });
}
