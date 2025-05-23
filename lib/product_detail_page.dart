import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;
  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Chi tiết sản phẩm', style: TextStyle(fontSize: 14),),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 24,
        leadingWidth: 24,
        leading: InkWell(
          onTap: () => context.go('/products'),
          child: Icon(Icons.arrow_back, size: 16),
        ),
      ),
    );
  }
}
