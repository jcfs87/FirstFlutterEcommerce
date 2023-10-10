import 'package:e_commerce/details/deliveryDetails.dart';
import 'package:e_commerce/src/delivery_grid.dart';
import 'package:e_commerce/src/login.dart';
import 'package:e_commerce/src/register.dart';
import 'package:e_commerce/src/principal_view.dart';
import 'package:e_commerce/src/equipment_view.dart';
import 'package:e_commerce/src/searchView.dart';
import 'package:flutter/material.dart';
import '../models/Cliente.dart';
import 'package:e_commerce/models/Product.dart';



void main() {
  final clienteManager = ClienteManager();
  Cliente? clienteActual = null;

  runApp(
      MyApp(clienteManager: clienteManager, clienteActual: clienteActual));
}

class MyApp extends StatelessWidget {
  final ClienteManager clienteManager;
  final Cliente? clienteActual ;


  const MyApp({Key? key, required this.clienteManager, required this.clienteActual}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(clienteManager: clienteManager),
        'register': (context) => Register(clienteManager: clienteManager),
        'delivery': (context) => DeliveryGrid(context: context, clienteManager: clienteManager),
        'equipment': (context) => EquipmentView(context: context, clienteManager: clienteManager),
        'principal_view': (context) => Builder(
          builder: (context) => PrincipalView(clienteManager: clienteManager, clienteActual: clienteActual),
        ),
        'searchView': (context) => SearchView(products: productList, clienteManager: clienteManager, clienteActual: clienteActual),
      },
    );
  }
}
