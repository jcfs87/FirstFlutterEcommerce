import 'package:flutter/material.dart';
import 'package:e_commerce/models/Cliente.dart';

import '../models/Product.dart';

class CartView extends StatefulWidget {
  final Cliente cliente;
  final Product product;

  const CartView({Key? key, required this.cliente, required this.product}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  void removeProductFromCart(Product product) {
    setState(() {
      widget.cliente.cart.removeFromCart(product);
    });
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for(var item in widget.cliente.cart.items) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cliente.cart.items.length,
                itemBuilder: (context, index) {
                  final producto = widget.cliente.cart.items[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          producto.image,
                          fit: BoxFit.cover,
                          height: 60,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              producto.title,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${producto.price}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removeProductFromCart(producto),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Precio a pagar: \$${calculateTotalPrice()}',
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: (){

                },
                child: Text('Siguiente'),
              ),
            )

          ],
        ),
      ),

    );
  }
}
