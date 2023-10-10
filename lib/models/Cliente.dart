import 'package:flutter/material.dart';
import 'Product.dart';
import 'cart.dart';

class Cliente {
  final String name;
  final String email;
  final String password;
  Cart cart; // Cambiamos a una instancia no final

  Cliente({
    required this.name,
    required this.email,
    required this.password,
    Cart? cart, // Cambiamos a un parámetro opcional
  }) : cart = cart ?? Cart(); // Asignamos un carrito vacío si no se proporciona

  void setCart(Cart newCart) {
    cart = newCart;
  }
}

class ClienteManager {
  List<Cliente> clientes = [
    Cliente(
      name: 'juan',
      email: 'juan@example.com',
      password: '123456',
    ),
    Cliente(
      name: 'pedro',
      email: 'pedro@example.com',
      password: 'abcdef',
    ),
  ];

  bool validarCliente(String email, String password) {
    for (var cliente in clientes) {
      if (cliente.email == email && cliente.password == password) {
        return true;
      }
    }
    return false;
  }

  void registrarCliente(Cliente cliente) {
    cliente.setCart(Cart()); // Crear un nuevo carrito vacío para el cliente
    clientes.add(cliente);
    print('Número de clientes registrados: ${clientes.length}');
  }

  void addProductoAcliente(Cliente cliente, Product product) {
    // Agrega el producto al carrito del cliente
    cliente.cart.addToCart(product);

  }

}

