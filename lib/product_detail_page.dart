import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;
  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Text("Product detail: $id");
  }
}
