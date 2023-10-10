import 'package:e_commerce/components/floating_button.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/components/body.dart';
import 'package:e_commerce/constant.dart';
import '../components/categories.dart';
import '../models/Cliente.dart';

class EquipmentView extends StatelessWidget {
  final BuildContext context;
  final ClienteManager clienteManager;
  final Cliente? clienteActual;
  const EquipmentView({Key? key, required this.context, required this.clienteManager, this.clienteActual}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> equipmentProducts = productList.where((product) => product.seccion == 'equipment').toList();
    final clienteActual =
    ModalRoute.of(context)?.settings.arguments as Cliente?;

    final String clienteEmail = clienteActual?.email ?? 'N/A';

    print('El cliente es equipment_view: $clienteEmail');
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Categories(categories: ['Ollas', 'Sartenes', 'thermes', 'Arroceras','Batidoras','Filtros'], selectedIndex: 0),
          Expanded(child: Body(equipmentProducts: equipmentProducts, clienteManager: clienteManager,clienteActual: clienteActual)
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
      title: Text('Equipos'),
      backgroundColor: Colors.green,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search),
            onPressed: () {Navigator.pushNamed(context, 'searchView');}
        ),
        IconButton(icon: Icon(Icons.history),
            onPressed: () {}
        ),
        SizedBox(width: kDefaultPaddin / 2,)
      ],

    );

  }
}