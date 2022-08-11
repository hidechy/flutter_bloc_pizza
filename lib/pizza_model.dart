import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Pizza({required this.id, required this.name, required this.image});

  @override
  List<Object?> get props => [id, name, image];

  static List<Pizza> pizzas = [
    Pizza(
      id: '0',
      name: 'Pizza0',
      image: Image.network(
          'https://pizza-olive.co.jp/wp-content/themes/olive/library/images/top-pizza.jpg'),
    ),
    Pizza(
      id: '1',
      name: 'Pizza1',
      image: Image.network(
          'https://www.nisshin.com/entertainment/komugiko_club/img/img_pizza.jpg'),
    ),
  ];
}
