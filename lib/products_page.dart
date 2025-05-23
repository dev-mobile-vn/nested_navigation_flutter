import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (item) => ListTile(
              onTap: () {
                context.go('/products/detail/$item');
              },
              title: Text("Ten san pham $item"),
              subtitle: Text("Ten san pham $item"),
            ),
          ),
        ),
      ),
    );
  }
}
