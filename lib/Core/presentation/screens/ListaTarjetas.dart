import 'package:bhm_app/Core/presentation/screens/HomePage.dart';
import 'package:bhm_app/Core/presentation/widgets/ListaTarjeta/tarjeta.dart';
import 'package:flutter/material.dart';

class ListaTarjetas extends StatefulWidget {
  const ListaTarjetas({super.key});

  @override
  State<ListaTarjetas> createState() => _ListaTarjetasState();
}

class _ListaTarjetasState extends State<ListaTarjetas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),       
        title: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
            const Text('Lista de Tarjetas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
            Container(),
            Container(),
            Container(),
            
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
            decoration:  BoxDecoration(color: const Color.fromARGB(255, 238, 235, 233),
            borderRadius: BorderRadius.circular(10.0)),
            child: tarjeta('assets/images/homeImages/Tarjeta.jpg',
                'Tarjeta de credito', 'AquaCard', '1578-9856-8795-9548'),
          )
        ],
      ),
    );
  }
}
