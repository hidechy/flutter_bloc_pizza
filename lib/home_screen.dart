import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pizza_bloc.dart';

import 'pizza_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('The Pizza Bloc')),

      //

      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaInitial) {
              return const CircularProgressIndicator();
            }
            if (state is PizzaLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.pizzas.length.toString()),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: size.height / 1.5,
                    width: size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0;
                            index < state.pizzas.length;
                            index++)
                          Positioned(
                            left: Random().nextInt(250).toDouble(),
                            top: Random().nextInt(400).toDouble(),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: state.pizzas[index].image,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('something wrong');
            }
          },
        ),
      ),

      //

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<PizzaBloc>().add(
                    AddPizza(pizza: Pizza.pizzas[0]),
                  );
            },
            child: const Icon(Icons.local_pizza_outlined),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<PizzaBloc>().add(
                    RemovePizza(pizza: Pizza.pizzas[0]),
                  );
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),

          //

          FloatingActionButton(
            onPressed: () {
              context.read<PizzaBloc>().add(
                    AddPizza(pizza: Pizza.pizzas[1]),
                  );
            },
            child: const Icon(Icons.local_pizza),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<PizzaBloc>().add(
                    RemovePizza(pizza: Pizza.pizzas[1]),
                  );
            },
            child: const Icon(Icons.remove),
          ),

          //
        ],
      ),
    );
  }
}
