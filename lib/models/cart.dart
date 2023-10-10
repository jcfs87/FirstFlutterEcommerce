
import 'Product.dart';

class Cart {
  List<Product> items = [];

  void addToCart(Product product) {
    items.add(product);
    print('Elementos en el carrito: ${items.length}');

  }

  void removeFromCart(Product product) {
    items.remove(product);
    print('Elementos en el carrito: ${items.length}');
  }
}
