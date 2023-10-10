import 'package:e_commerce/components/categories.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:flutter/material.dart';

import '../details/deliveryDetails.dart';
import '../models/Cliente.dart';

class Body extends StatelessWidget {
  final List<Product>? deliveryProducts;
  final List<Product>? equipmentProducts;
  final ClienteManager clienteManager;
  final Cliente? clienteActual;

  const Body({Key? key, this.deliveryProducts, this.equipmentProducts, required this.clienteManager, this.clienteActual}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = deliveryProducts ?? equipmentProducts ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),

        ),
       // Categories(),
        Expanded(
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Número de columnas en el grid
              childAspectRatio: 0.75, // Proporción del ancho y alto de cada elemento
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                // Navegar a la pantalla de detalles del producto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryDetails(product: products[index], clienteManager: clienteManager, clienteActual: clienteActual),
                    settings: RouteSettings(
                      arguments: clienteActual,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin), // Espacio entre cada producto
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          products[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                      child: Text(
                        products[index].title,
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ),
                    Text(
                      "\$${products[index].price.toString()}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




