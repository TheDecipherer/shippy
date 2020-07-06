import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        /// create method can be used but can cause bugs.
        /// value is an alternative, check main.dart for create usage.
        /// approach is must for list and grid items.
        value: products[index],
        child: ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}
