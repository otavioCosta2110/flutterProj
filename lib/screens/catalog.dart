
import 'package:flutter/material.dart';
import 'package:gustavo/screens/product.dart';
import 'package:gustavo/models/product.dart';

class CatalogPage extends StatelessWidget {
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
            childAspectRatio: 0.85
          ),
          
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {

            return Padding(
              padding: const EdgeInsets.all(11.0),
              child: GestureDetector(
                onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductPage(product: products[index]),
                      ),
                    );
                },
                child: Card(
                   elevation: 8,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                     const SizedBox(height: 12),
                     ClipRRect(
                       borderRadius: BorderRadius.circular(20) ,
                       child: Image.asset(
                         products[index].imageUrl,
                         width: 165,
                         height: 165,
                         fit: BoxFit.cover,
                         ),
                       ),
                     const SizedBox(height: 6),
                     Text(
                       products[index].name,
                       textAlign: TextAlign.center,
                       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                       ),
                     Text(
                         'R\$ ${products[index].price.toStringAsFixed(2)}',
                         textAlign: TextAlign.center,
                         style: const TextStyle(fontSize: 14),
                         ),
                     ],
                     ),
                     ),
              )
            );
          },
        ),
      ),
    );
  }
}

