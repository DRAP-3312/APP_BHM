import 'package:bhm_app/Core/presentation/screens/CodigoTrans.dart';
import 'package:flutter/material.dart';

class Monto extends StatefulWidget {
  const Monto({Key? key}) : super(key: key);

  @override
  _MontoState createState() => _MontoState();
}

class _MontoState extends State<Monto> {
  final TextEditingController _amountController = TextEditingController();
  String _textFieldValue = '';
   final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _focusNode.requestFocus();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Text(
              'Cantidad de retiro',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
            const Text(
              'Saldo disponible',
              style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w200),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '\$10000',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40.0),
            const Row(
              children: [
                Icon(Icons.credit_card, color: Colors.grey),
                SizedBox(width: 10.0),
                Text('**** **** **** 9548',
                    style: TextStyle(fontSize: 20.0, letterSpacing: 2.0)),
              ],
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Ingrese la cantidad a retirar',
              style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w200),
            ),
            TextField(
              controller: _amountController,
              focusNode: _focusNode,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style:
                  const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Color(0xffFF6347)),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: '0',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  _textFieldValue =
                      value; // Actualizar la variable con el nuevo valor
                });
              },
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CodigoTrans(valorSaldo: _textFieldValue,)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:const Color(0xff16697A),
                ),
                child:  Container(
                  padding:const EdgeInsets.all(3.0),
                  alignment: Alignment.center,
                  height: 60,
                  width: 70,
                  child:  const Text('Listo', style: TextStyle(fontSize: 20),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
