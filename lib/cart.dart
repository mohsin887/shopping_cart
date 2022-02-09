import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/cart_model.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var trueModel = Provider.of<CartModel>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cart Page'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Cart Item',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Consumer<CartModel>(
            //   builder: (context, cart, child) {
            //     return Expanded(
            //       child: ListView.separated(
            //           itemBuilder: (BuildContext context, int index) {
            //             return ListTile(
            //               title: Text(
            //                 cart.selectedProducts[index],
            //                 style: const TextStyle(
            //                     fontSize: 16, color: Colors.grey),
            //               ),
            //             );
            //           },
            //           separatorBuilder: (BuildContext context, int index) =>
            //               const Divider(),
            //           itemCount: cart.selectedProducts.length),
            //     );
            //   },
            // ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        trueModel.selectedProducts[index],
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: trueModel.selectedProducts.length),
            ),
          ],
        ),
      ),
    );
  }
}
