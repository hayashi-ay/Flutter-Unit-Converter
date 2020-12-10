import 'package:category_widget/converter_screen.dart';
import 'package:flutter/material.dart';

import 'unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorSwatch highlightColor;
  final List<Unit> units;

  const Category({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.highlightColor,
    @required this.units,
  })  : assert(label != null),
        assert(icon != null),
        assert(highlightColor != null),
        assert(units != null),
        super(key: key);

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }

    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (context) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                label,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            body: ConverterScreen(
              units: units,
              color: highlightColor,
            ));
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _rowHeight,
      child: InkWell(
        borderRadius: _borderRadius,
        highlightColor: highlightColor,
        onTap: () {
          _navigateToConverter(context);
          print('I was tapped!');
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(icon, size: 60.0),
              ),
              Center(
                child: Text(label, style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
