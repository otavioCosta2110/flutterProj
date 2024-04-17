
import 'package:flutter/material.dart';
import '../main.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  const Product({required this.id, required this.name, required this.price, required this.imageUrl});
}

class CatalogPage extends AppProj {
  const CatalogPage({super.key});

  static const List<Product> products = [
    Product(id: 1, name: 'Leite Ninho', price: 30.00, imageUrl: 'assets/leite-ninho.png'),
    Product(id: 2, name: 'Unidade de Pão', price: 1.00, imageUrl: 'assets/pao.png'),
    Product(id: 3, name: 'Suco de Laranja', price: 12.00, imageUrl: 'assets/suco-laranja.png'),
    Product(id: 4, name: 'Perfume', price: 197.00, imageUrl: 'assets/perfume.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width ~/ 200;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Catálogo de Produtos'),
      ),

      body: SingleChildScrollView(

        child: GridView.builder(
          shrinkWrap: true,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
          
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {

            return Padding(

                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: ListTile(
                onTap: () {
                  // Navegar para a pagina do produto correspondente
                },

                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    const SizedBox(height: 10),

                    Image.asset(
                      products[index].imageUrl,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),

                    const SizedBox(height: 5),

                    Text(
                      products[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'R\$ ${products[index].price.toStringAsFixed(2)}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

