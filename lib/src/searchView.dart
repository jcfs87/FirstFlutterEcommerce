import 'package:flutter/material.dart';
import 'package:e_commerce/models/Product.dart';

import '../details/deliveryDetails.dart';
import '../models/Cliente.dart';

class SearchView extends StatefulWidget {
  final List<Product> products;
  final ClienteManager clienteManager;
  final Cliente? clienteActual;


  const SearchView({Key? key, required this.products, required this.clienteManager, this.clienteActual})
      : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Product> filteredList = [];

  void filterProducts(String query) {
    setState(() {
      filteredList = widget.products
          .where((product) =>
      product.title.toLowerCase().contains(query.toLowerCase()) ||
          product.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: TextField(
                  onChanged: filterProducts,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "¿Qué buscas?",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 30),
                Visibility(
                  visible: filteredList.isEmpty,
                  child: Card(
                    child: Image.asset('assets/images/back_buscador.png', fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(filteredList[index].image),
                      title: Text(filteredList[index].title),
                      subtitle: Text(filteredList[index].description),
                      trailing: Text('\$${filteredList[index].price.toString()}'),
                      onTap: () {
                        // Handle the product tap event
                        navigateToProductDetails(filteredList[index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigateToProductDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeliveryDetails(product: product, clienteManager: widget.clienteManager, clienteActual: widget.clienteActual),
      ),
    );
  }
}



