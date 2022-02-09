import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/cart_model.dart';

class ProductList extends StatelessWidget {
  final products = List<String>.generate(20, (index) => 'Product No $index');

  @override
  Widget build(BuildContext context) {
    dynamic loadedModel = Provider.of<CartModel>(context, listen: false);
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              products[index],
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            onTap: () {
              loadedModel.add(products[index]);
              SnackBar s = SnackBar(
                content: Text('Product No $index is added'),
              );
              Scaffold.of(context).showSnackBar(s);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: products.length);
  }
}
