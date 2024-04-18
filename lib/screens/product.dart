import 'package:flutter/material.dart';
import 'package:gustavo/models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(product.name),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(product.name, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text(
              'R\$ ${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Wrap(
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 15),
                  Text('Adicionar ao carrinho'),
                ]
            ),
            ),
          ],
        ),
      )
    );
  }
}

