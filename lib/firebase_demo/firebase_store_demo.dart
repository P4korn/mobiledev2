import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('Products');

  Future<void> createProduct(
      String name, String description, double price) async {
    await products.add({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  //Update
  Future<void> updateProduct(
      String docId, String name, String description, double price) async {
    await products.doc(docId).update({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  //Delete
  Future<void> deleteProduct(String docId) async {
    await products.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: StreamBuilder<QuerySnapshot>(
          stream: products.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final data = snapshot.data!.docs;

            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final product = data[index];
                String productId = product.id; // ดึงค่า ID ของเอกสาร

                return ListTile(
                  leading: Text(productId),
                  title: Text(product['name']),
                  subtitle: Text(product['description']),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete,
                          color: Colors.red), // Trash icon
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirm Delete"),
                                content: const Text(
                                    "Are you sure you want to delete this product?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Delete the product if confirmed
                                      await deleteProduct(productId);
                                      Navigator.of(context)
                                          .pop(); // Close the dialog after deletion
                                    },
                                    child: const Text("Delete",
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              );
                            });
                      }),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createProduct("Vivo", "Vivo Phone", 5555);
          },
          child: Icon(Icons.add),
        ));
  }
}
