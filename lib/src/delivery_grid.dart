import 'package:flutter/material.dart';
import 'package:e_commerce/components/body.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/src/searchView.dart';


import '../components/categories.dart';
import '../components/floating_button.dart';
import '../models/Cliente.dart';
import '../models/Product.dart';

class DeliveryGrid extends StatelessWidget {
  final BuildContext context;
  final ClienteManager clienteManager;
  final Cliente? clienteActual;
  const DeliveryGrid({Key? key, required this.context, required this.clienteManager, this.clienteActual}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> deliveryProducts = productList.where((product) => product.seccion == 'delivery').toList();
    final clienteActual =
    ModalRoute.of(context)?.settings.arguments as Cliente?;

    final String clienteEmail = clienteActual?.email ?? 'N/A';

    print('El cliente es deliveryGrid: $clienteEmail');
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Categories(categories: ['Pasta', 'Carne', 'Pescado', 'verduras', 'Postres'], selectedIndex: 0),
          Expanded(child: Body(deliveryProducts: deliveryProducts, clienteManager: clienteManager, clienteActual: clienteActual),
          ),

        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
          color: Colors.green,
        ),
        child: CustomFloatingButtons(),
      ),

    );
  }
      AppBar buildAppBar() {
        return AppBar(
          title: Text('Delivery'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),
                onPressed: () {Navigator.pushNamed(context, 'searchView'); }
            ),
            IconButton(icon: Icon(Icons.history),
                onPressed: () {}
            ),
            SizedBox(width: kDefaultPaddin / 2,)
          ],

        );

      }
  }

