import 'package:flutter/material.dart';

import 'category.dart';
import 'unit.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen();

  static const _categoryLabels = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (context, index) => categories[index],
      itemCount: categories.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryLabel) {
    return List.generate(10, (index) {
      return Unit(
        name: '$categoryLabel Unit $index',
        conversion: index.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (var i = 0; i < _categoryLabels.length; i++) {
      categories.add(Category(
        label: _categoryLabels[i],
        icon: Icons.cake,
        highlightColor: _baseColors[i],
        units: _retrieveUnitList(_categoryLabels[i]),
      ));
    }

    final listView = Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      title: Text(
        "Unit Converter",
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(66, 165, 245, 1.0),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
