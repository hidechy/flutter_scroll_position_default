// ignore_for_file: must_be_immutable, avoid_field_initializers_in_const_classes

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollablePositionedListComponent extends StatelessWidget {
  const ScrollablePositionedListComponent(this.controller, {super.key});

  final ItemScrollController controller;

  final int maxItemCount = 300;

  ///
  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: maxItemCount,
      itemScrollController: controller,
      itemBuilder: (context, index) {
        return Container(
          height: (Random().nextInt(400) + 20).toDouble(),
          color: Color.fromRGBO(
            Random().nextInt(256),
            Random().nextInt(256),
            Random().nextInt(256),
            1,
          ),
          child: Center(
            child: Text(
              index.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
