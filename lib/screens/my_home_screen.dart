import 'package:bloc_counter/counter/counter_bloc.dart';
import 'package:bloc_counter/counter/counter_event.dart';
import 'package:bloc_counter/counter/counter_state.dart';
import 'package:bloc_counter/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.title});

  final String title;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('Rebuild UI');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            // here event doesnot count  1.Bloc Builder
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            //

            // bloc listener  notification like snackbar
            // BlocListener<CounterBloc, CounterState>(
            //   listener: (context, state) {
            //     if (state.count == 2) {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => ProductScreen()),
            //       );
            //     }
            //   },
            //   child: Text('Bloc Listener'),
            // ),

            // Bloc Consumer
            BlocConsumer<CounterBloc, CounterState>(
              builder: (context, state) {
                return Column(
                  children: [
                    state.isloading
                        ? CircularProgressIndicator()
                        : Text('Nothing to show'),
                    Text('Counter Value is ${state.count}'),
                  ],
                );
                // return Text('Counter Value is ${state.count}');
              },
              listener: (context, state) {
                if (state.count == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductScreen()),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: .end,
        spacing: 20,
        children: [
          FloatingActionButton(
            onPressed: () {
              // here event are counted but satet doesnot count
              context.read<CounterBloc>().add(IncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(ResetEvent());
            },
            child: Icon(Icons.restart_alt),
          ),
        ],
      ),
    );
  }
}
