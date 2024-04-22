import 'package:flutter/material.dart';
import 'package:gustavo/screens/login.dart';
import 'package:gustavo/screens/register.dart';
import 'package:gustavo/models/product.dart';
import 'package:gustavo/screens/product.dart';

void main() {
  runApp(const AppProj());
}


class AppProj extends StatelessWidget {

  const AppProj({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalogo de produtos',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Product> products = [
    Product(id: 1, name: 'Leite Ninho', price: 30.00, imageUrl: 'assets/leite-ninho.png'),
    Product(id: 2, name: 'Unidade de Pão', price: 1.00, imageUrl: 'assets/pao.png'),
    Product(id: 3, name: 'Suco de Laranja', price: 12.00, imageUrl: 'assets/suco-laranja.png'),
    Product(id: 4, name: 'Perfume', price: 197.00, imageUrl: 'assets/perfume.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width ~/ 200;
    final cardWidth = MediaQuery.of(context).size.width / crossAxisCount - 20;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de produtos'),
        toolbarHeight: 40,
        actions: [
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 7.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.28,
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: LoginPage(),
                              ),
                            );
                          },
                        );
                      },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: null,
                              shape: null,
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.height * 0.7,
                                child: RegisterPage(),
                              ),
                            );
                          },
                        );
                      },
                        child: const Text(
                          'Registro',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      body: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: cardWidth / (cardWidth * 1.3),
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(11.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductPage(product: products[index]),
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
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          products[index].imageUrl,
                          width: cardWidth * 0.8,
                          height: cardWidth * 0.8,
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
                        style: const TextStyle(fontSize: 14 ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
