// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'components/indexed_list_view_list_component.dart';
import 'components/scroll_to_index_list_component.dart';
import 'components/scrollable_positioned_list_component.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  static const List<String> _titles = [
    'scroll_to_index',
    'indexed_list_view',
    'scrollable_positioned_list',
  ];
  static const List<IconData> _icons = [
    Icons.home,
    Icons.notifications,
    Icons.search,
  ];

  final _autoScrollController = AutoScrollController();
  final _indexedScrollController = IndexedScrollController();
  final _itemScrollController = ItemScrollController();

  int _selectedIndex = 0;

  final int _maxItemCount = 300;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      ScrollToIndexListComponent(_autoScrollController),
      IndexedListViewListComponent(_indexedScrollController),
      ScrollablePositionedListComponent(_itemScrollController),
    ];

    return Scaffold(
      //

      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),

      //

      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          for (int i = 0; i < pages.length; i++)
            Offstage(
              offstage: _selectedIndex != i,
              child: pages[i],
            ),
        ],
      ),

      //

      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () async {
              final index = Random().nextInt(_maxItemCount);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green[900]!.withOpacity(0.5),
                  content: Text(
                    index.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  duration: const Duration(milliseconds: 1000),
                ),
              );

              switch (_selectedIndex) {
                case 0:
                  await _autoScrollController.scrollToIndex(
                    index,
                    preferPosition: AutoScrollPosition.begin,
                  );

                  break;
                case 1:
                  _indexedScrollController.jumpToIndex(index);
                  break;
                case 2:
                  _itemScrollController.jumpTo(index: index);
                  break;
              }
            },
            child: const Icon(Icons.arrow_downward),
          );
        },
      ),

      //

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for (int i = 0; i < pages.length; i++)
            BottomNavigationBarItem(
              icon: Icon(_icons[i]),
              label: _titles[i],
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      //
    );
  }
}
