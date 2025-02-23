import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledev2/Api_/product_api.dart';
import 'package:mobiledev2/model/product_data.dart';

class ProductAPICall extends StatefulWidget {
  const ProductAPICall({super.key});

  @override
  State<ProductAPICall> createState() => _ProductAPICallState();
}

class _ProductAPICallState extends State<ProductAPICall> {
  List<ProductData> products = [];
  final ProductApiService productapi = ProductApiService();

  Future<void> fetchData() async {
    try {
      List<ProductData> fetchedProducts = await productapi.fetchProducts();
      setState(() {
        products = fetchedProducts;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addProduct(String name, double price, String description) async {
    ProductData newProduct = ProductData(
      name: name,
      price: price,
      description: description,
    );

    bool success = await productapi.createProduct(newProduct);

    if (success) {
      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully!')),
      );
      fetchData(); // Refresh product list
    } else {
      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add product. Please try again.')),
      );
    }
  }

  void showAddProductDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    String? nameError;
    String? priceError;
    String? descriptionError;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text("Add Product"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Product Name", errorText: nameError),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                      labelText: "Price", errorText: priceError),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                    controller:
                        descriptionController, // Added description field
                    decoration: InputDecoration(
                        labelText: "Description", errorText: descriptionError)),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    nameError = null;
                    priceError = null;
                    descriptionError = null;
                  });

                  String name = nameController.text;
                  double? price = double.tryParse(priceController.text);
                  String description =
                      descriptionController.text; // Capture description

                  bool valid = true;

                  // Validate name
                  if (name.isEmpty) {
                    setState(() {
                      nameError = 'Name is required';
                    });
                    valid = false;
                  }

                  // Validate price
                  if (price == null || price <= 0) {
                    setState(() {
                      priceError = 'Enter a valid price';
                    });
                    valid = false;
                  }

                  // Validate description
                  if (description.isEmpty) {
                    setState(() {
                      descriptionError = 'Description is required';
                    });
                    valid = false;
                  }

                  if (valid) {
                    // If all fields are valid, add the product
                    addProduct(name, price!, description);
                    Navigator.pop(context); // Close dialog after adding
                  }
                },
                child: const Text("Add"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context), // Close dialog
                child: const Text("Cancel"),
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> updateProduct(
      int id, String name, double price, String description) async {
    ProductData updatedProduct = ProductData(
      id: id,
      name: name,
      price: price,
      description: description,
    );

    bool success = await productapi.updateProduct(updatedProduct);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product updated successfully!')),
      );
      fetchData(); // Refresh product list
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update product. Please try again.')),
      );
    }
  }

  void showUpdateProductDialog(ProductData product) {
    final TextEditingController nameController =
        TextEditingController(text: product.name);
    final TextEditingController priceController =
        TextEditingController(text: product.price.toString());
    final TextEditingController descriptionController =
        TextEditingController(text: product.description);

    String? nameError;
    String? priceError;
    String? descriptionError;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Update Product"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: "Product Name", errorText: nameError),
                  ),
                  TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                        labelText: "Price", errorText: priceError),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        labelText: "Description", errorText: descriptionError),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text.trim();
                    double? price =
                        double.tryParse(priceController.text.trim());
                    String description = descriptionController.text.trim();

                    setState(() {
                      nameError = name.isEmpty ? 'Name is required' : null;
                      priceError = (price == null || price <= 0)
                          ? 'Enter a valid price'
                          : null;
                      descriptionError = description.isEmpty
                          ? 'Description is required'
                          : null;
                    });

                    if (nameError == null &&
                        priceError == null &&
                        descriptionError == null) {
                      updateProduct(product.id!, name, price!, description);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Update"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showProductOptions(ProductData product) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Product'),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
                showUpdateProductDialog(product); // Open update dialog
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Delete Product'),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
                confirmDeleteProduct(product.id!);
              },
            ),
          ],
        );
      },
    );
  }

  void confirmDeleteProduct(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this product?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close dialog
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close dialog
                bool success = await productapi.deleteProduct(id);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Product deleted successfully!')),
                  );
                  fetchData(); // Refresh product list
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to delete product.')),
                  );
                }
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product"),
          backgroundColor: Colors.purple,
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text('${products[index].id}'),
                title: Text(products[index].name),
                subtitle: Text(products[index].description),
                trailing: Text(
                  '${products[index].price}',
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                onTap: () {
                  showProductOptions(products[index]);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: products.length),
        floatingActionButton: FloatingActionButton(
          onPressed: showAddProductDialog,
          child: Icon(Icons.add),
        ));
  }
}
