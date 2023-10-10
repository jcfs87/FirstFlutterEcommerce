import 'package:e_commerce/src/cartView.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/Product.dart';

import '../models/Cliente.dart';


class DeliveryDetails extends StatelessWidget {
  final Product product;
  final ClienteManager clienteManager;
  final Cliente? clienteActual;



  const DeliveryDetails({Key? key, required this.product, required this.clienteManager, this.clienteActual}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final clienteActual =
    ModalRoute.of(context)?.settings.arguments as Cliente?;

    final String clienteEmail = clienteActual?.email ?? 'N/A';

    print('El cliente es deliveryDetails: $clienteEmail');
    void navigateBack() {
      Navigator.pop(context);
    }
    void addToCart() {
      if (clienteActual != null) {
        clienteManager.addProductoAcliente(clienteActual!, product);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Producto añadido al carrito'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartView(cliente: clienteActual!,product: product),
                      ),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: navigateBack,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            product.image, fit: BoxFit.cover
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              product.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "\$${product.price.toString()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: addToCart, // Llamar al método addToCart sin paréntesis
              child: Text('Añadir'),
            ),
          )


        ],
      ),
    );
  }
}

