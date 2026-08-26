import 'package:bloc_counter/product/product_bloc.dart';
import 'package:bloc_counter/product/product_event.dart';
import 'package:bloc_counter/product/product_state.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Detail')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(22),
            child: ElevatedButton(
              onPressed: () {
                context.read<ProductBloc>().add(GetProductEvent());
              },
              child: Text('Get Product'),
            ),
          ),

          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ProductLoaded) {
                  final product = state.product;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,

                    itemCount: product.length,

                    itemBuilder: (context, index) {
                      final item = product[index];
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(100),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: .start,
                          spacing: 20,
                          children: [
                            Image.network(
                              product[index].image.toString(),
                              height: 150,
                              width: 100,
                            ),

                            Expanded(
                              child: Column(
                                spacing: 10,
                                crossAxisAlignment: .start,

                                children: [
                                  Text(
                                    product[index].title.toString() ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    product[index].category.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Row(
                                    spacing: 5,
                                    crossAxisAlignment: .center,
                                    children: [
                                      Icon(Icons.star, color: Colors.orange),
                                      Text(item.rating!.rate.toString()),
                                      Text(item.rating!.count.toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(
                                top: 50,
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                spacing: 10,
                                mainAxisAlignment: .center,
                                crossAxisAlignment: .center,
                                children: [
                                  Text("\$${item.price}"),
                                  Icon(Icons.shopping_cart),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return Center(child: Text('press button above'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
