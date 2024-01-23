import 'package:flutter/material.dart';

void main ()=>((const TarjetaCredito()));

class TarjetaCredito extends StatelessWidget {
  const TarjetaCredito({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tarjeta(),
    );
  }
}

class Tarjeta extends StatelessWidget {
  const Tarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TARGETA DE CREDITO'),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 200,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.5),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 29, 26, 179),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            children: [
              const Text('Vista Empresarial', style: TextStyle(color: Colors.white, fontSize: 18),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.network('https://www.shutterstock.com/image-illustration/credit-card-chip-silver-isolated-600nw-490291144.jpg'),
                  )
                ],
              ),
              const Text('4000 1234 5678 9010', style: TextStyle(color: Colors.white, fontSize: 25)),
              const Text('12/24', style: TextStyle(color: Colors.white, fontSize: 14)),
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text('C.Arias', style: TextStyle(color: Colors.white, fontSize: 14))
                ],
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text('NOMBRE DE LA EMPRESA', style: TextStyle(color: Colors.white, fontSize: 14)),
                   SizedBox(
                    width: 50,
                    height: 30,
                    child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png'),
                   )
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}