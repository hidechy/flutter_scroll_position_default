// ignore_for_file: must_be_immutable, avoid_field_initializers_in_const_classes

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

class ScrollToIndexListComponent extends StatelessWidget {
  const ScrollToIndexListComponent(this.controller, {super.key});

  final AutoScrollController controller;

  final int maxItemCount = 300;

  ///
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: maxItemCount,
      itemBuilder: (context, index) {
        return AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          child: Container(
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
          ),
        );
      },
    );
  }
}
