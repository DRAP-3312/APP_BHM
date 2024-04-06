import 'package:bhm_app/Core/presentation/widgets/Help/opcionHelp.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Center(child:  Text('¿Necesitas ayuda?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)), 
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: ListView(
          children: [
            opcionHelp(Icons.call,'Hablar con mi asesor digital'),
            opcionHelp(Icons.payment,'Reportar tarjeta'),
            opcionHelp(Icons.history_edu,'Aclaraciones'),
            opcionHelp(Icons.text_snippet,'Comprobantes y legales'),
             opcionHelp(Icons.chat,'Conoce la App'),
            opcionHelp(Icons.fax,'Sucursales y cajeros'),
            opcionHelp(Icons.connect_without_contact,'Contáctanos'),
            opcionHelp(Icons.power_settings_new,'Desactivar App')
          ],
        ),
      )
    );
  }
}