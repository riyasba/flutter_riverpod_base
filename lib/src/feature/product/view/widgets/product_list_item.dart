import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';

import '../../../../models/git_repo_model.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});

  final Item product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.fullName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Text(product.description!),
        ],
      ),
    );
  }
}