import 'package:flutter/material.dart';

import '../models/Cliente.dart';

class PrincipalView extends StatelessWidget {
  final ClienteManager clienteManager;
  final Cliente? clienteActual;
  const PrincipalView({Key? key, required this.clienteManager, required this.clienteActual}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clienteActual =
    ModalRoute.of(context)?.settings.arguments as Cliente?;

    final String clienteEmail = clienteActual?.email ?? 'N/A';

    print('El cliente es principalView: $clienteEmail');
    return Scaffold(
      appBar: AppBar(
        title: Text('Select'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Image.asset(
                'assets/images/comidas.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'delivery', arguments: clienteActual);
                  },
                  child: Text('Gourmet Delivery'),
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Espacio entre las imágenes
          Stack(
            children: [
              Image.asset(
                'assets/images/equipos.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'equipment', arguments: clienteActual);
                  },
                  child: Text('Cooking equipment'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

