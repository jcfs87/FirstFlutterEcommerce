import 'package:flutter/material.dart';

class CustomFloatingButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'profile');
          },
          child: Icon(Icons.person), // Icono de persona
          backgroundColor: Colors.green,
          elevation: 0.0,
        ),
        SizedBox(width: 8.0), // Espacio entre los íconos
        FloatingActionButton(
          onPressed: () {
            // Acciones al hacer clic en el carrito de compra
            // Por ejemplo, puedes abrir una pantalla de carrito de compra
            Navigator.pushNamed(context, 'cart');
          },
          child: Icon(Icons.shopping_cart), // Icono de carrito de compra
          backgroundColor: Colors.green,
          elevation: 0.0,
        ),
      ],
    );
  }
}
