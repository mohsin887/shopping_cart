import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart.dart';
import 'package:shopping_cart/model/cart_model.dart';
import 'package:shopping_cart/product_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider<CartModel>(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  List<String> selectedProducts = <String>[];
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          )
        ],
      ),
      body: ProductList(),
    );
  }
}
