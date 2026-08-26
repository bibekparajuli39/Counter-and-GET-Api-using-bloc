import 'package:bloc_counter/counter/counter_bloc.dart';
import 'package:bloc_counter/product/product_bloc.dart';
import 'package:bloc_counter/product/product_repository.dart';
import 'package:bloc_counter/screens/my_home_screen.dart';
import 'package:bloc_counter/screens/product_screen.dart';
import 'package:bloc_counter/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(
            create: (_) => ProductBloc(ProductRepository(ApiService())),
          ),
        ],

        child: ProductScreen(),
      ),
    );
  }
}
