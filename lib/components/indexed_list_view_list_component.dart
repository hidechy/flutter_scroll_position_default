import 'dart:math';

import 'package:flutter/material.dart';

import 'package:indexed_list_view/indexed_list_view.dart';

class IndexedListViewListComponent extends StatelessWidget {
  const IndexedListViewListComponent(this.controller, {super.key});

  final IndexedScrollController controller;

  @override
  Widget build(BuildContext context) {
    return IndexedListView.builder(
      controller: controller,
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
