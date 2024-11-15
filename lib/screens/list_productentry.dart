import 'package:flutter/material.dart';
import 'package:takhor_mobile/models/product_entry.dart';
import 'package:takhor_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});
  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    try {
      var response = await request.get('http://localhost:8000/json/');
      List<ProductEntry> products = [];
      List<dynamic> jsonList = response;

      for (var item in jsonList) {
        products.add(ProductEntry.fromJson(item));
      }
      return products;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data produk.',
                    style: TextStyle(fontSize: 20, color: Colors.indigo),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("Price: Rp${snapshot.data![index].fields.price}"),
                        const SizedBox(height: 10),
                        Text("Stock: ${snapshot.data![index].fields.quantity}"),
                        const SizedBox(height: 10),
                        Text(
                            "Description: ${snapshot.data![index].fields.description}"),
                        if (snapshot.data![index].fields.image.isNotEmpty) ...[
                          const SizedBox(height: 10),
                          Image.network(
                            snapshot.data![index].fields.image,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
