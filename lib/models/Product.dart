import 'package:flutter/material.dart';

class Product {
  final String image;
  final String title;
  final String description;
  final int price;
  final int id;
  final String seccion;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.seccion,
  });
}
String dummyText = "Productos de calidad";
List<Product> productList = [
  Product(
    id: 1,
    image: 'assets/images/comida3.jpg',
    title: 'Platos 1',
    price: 10,
    description: 'Deliciosos platos tradicionales de la cocina española.',
    seccion: 'delivery',
  ),
  Product(
    id: 2,
    image: 'assets/images/comida3.jpg',
    title: 'Producto 2',
    price: 20,
    description: dummyText,
    seccion: 'delivery',
  ),
  Product(
    id: 3,
    image: 'assets/images/comida3.jpg',
    title: 'Producto 3',
    price: 15,
    description: dummyText,
    seccion: 'delivery',
  ),
  Product(
    id: 4,
    image: 'assets/images/comida3.jpg',
    title: 'Producto 4',
    price: 12,
    description: dummyText,
    seccion: 'delivery',
  ),
  Product(
    id: 5,
    image: 'assets/images/comida3.jpg',
    title: 'Producto 5',
    price: 25,
    description: dummyText,
    seccion: 'delivery',
  ),
  Product(
    id: 6,
    image: 'assets/images/comida3.jpg',
    title: 'Producto 6',
    price: 18,
    description: dummyText,
    seccion: 'delivery',
  ),
  Product(
    id: 7,
    image: 'assets/images/comida3.jpg',
    title: 'Producto 7',
    price: 30,
    description: dummyText,
    seccion: 'delivery',
  ),
  Product(
    id: 8,
    image: 'assets/images/comida3.jpg',
    title: 'Producto 8',
    price: 22,
    description: dummyText,
    seccion: 'delivery',
  ),
  Product(
    id: 9,
    image: 'assets/images/equipos.jpg',
    title: 'Equipo 1',
    price: 10,
    description: 'Equipo de alta calidad para uso profesional.',
    seccion: 'equipment',
  ),
  Product(
    id: 10,
    image: 'assets/images/equipos.jpg',
    title: 'Equipo 2',
    price: 20,
    description: dummyText,
    seccion: 'equipment',
  ),
  Product(
    id: 11,
    image: 'assets/images/equipos.jpg',
    title: 'Equipo 3',
    price: 15,
    description: dummyText,
    seccion: 'equipment',
  ),
  Product(
    id: 12,
    image: 'assets/images/equipos.jpg',
    title: 'Equipo 4',
    price: 12,
    description: dummyText,
    seccion: 'equipment',
  ),
];

