import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductScreen extends StatelessWidget {
  final ProductData product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9E9E9E),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  fit: BoxFit.scaleDown,
                  product.image,
                  height: 350,
                  width: 350,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                product.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                product.detail,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '${product.price.toString()} \$',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
