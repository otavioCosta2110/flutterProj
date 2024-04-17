import 'package:flutter/material.dart';
import '../main.dart';

class Product {
  final int id;
  final String name;
  final String imageUrl;

  const Product({required this.id, required this.name, required this.imageUrl});
}

class CatalogPage extends AppProj {
  const CatalogPage({super.key});

  static const List<Product> products = [
    Product(id: 1, name: 'Epic 1', imageUrl: 'assets/600x400.png'),
    Product(id: 2, name: 'Epic 2', imageUrl: 'assets/600x400.png'),
    Product(id: 3, name: 'Epic 3', imageUrl: 'assets/600x400.png'),
    Product(id: 4, name: 'Epic 4', imageUrl: 'assets/600x400.png'),
    Product(id: 5, name: 'Epic 5', imageUrl: 'assets/600x400.png'),
    Product(id: 6, name: 'Epic 6', imageUrl: 'assets/600x400.png'),
    Product(id: 7, name: 'Epic 7', imageUrl: 'assets/600x400.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width ~/ 200;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Catalog'),
      ),

      body: SingleChildScrollView(

        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          
          itemCount: products.length,
          
          itemBuilder: (BuildContext context, int index) {

            return Padding(

                padding: const EdgeInsets.all(10),
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

