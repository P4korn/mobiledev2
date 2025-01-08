// import 'dart:ffi';

import 'package:flutter/material.dart';

class productlayout extends StatelessWidget {
  const productlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Layout'),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
                height: 60,
                width: double.infinity,
                color: Colors.grey[300],
                child: Center(
                  child: Text('Category : Electronics',
                      style: TextStyle(fontSize: 25)),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    productwidget(
                        name: 'Laptop',
                        price: '999 THB',
                        imageurl:
                            'https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/Highlight-Surface-Laptop-Go-3-001-3000x1682:VP2-859x540'),
                    productwidget(
                        name: 'Tablet',
                        price: '499 THB',
                        imageurl:
                            'https://mediam.dotlife.store/media/catalog/product/t/h/th_ipad_pro_cellular_12-9_in_6th_gen_space_gray_pdp_image_5g_position-1b_3.jpg')
                  ],
                ),
                Column(
                  children: [
                    productwidget(
                        name: 'Smartphone',
                        price: '699 THB',
                        imageurl:
                            'https://media-cdn.bnn.in.th/426805/iPhone_16_Pro_Black_Titanium_1-square_medium.jpg'),
                    productwidget(
                        name: 'Camera',
                        price: '299 THB',
                        imageurl:
                            'https://store.sony.co.th/cdn/shop/products/Body_Kit-4_aa051d59-1a4c-453b-8b98-0e79fe4908cd_900x.jpg?v=1682318477')
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

class productwidget extends StatelessWidget {
  final String name;
  final String price;
  final String imageurl;

  const productwidget(
      {super.key,
      required this.name,
      required this.price,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageurl,
          width: 150,
          height: 150,
        ),
        Text(name),
        Text(
          price,
          style: TextStyle(color: Colors.green),
        ),
      ],
    );
  }
}
