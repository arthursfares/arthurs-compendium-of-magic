///
/// MODIFIED FROM flutter_material_pickers 3.1.4+1
///

import 'package:flutter/material.dart';

/// This helper widget manages the scrollable content inside a picker widget.
class ScrollPicker<T> extends StatefulWidget {
  const ScrollPicker({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  // Events
  final ValueChanged<T> onChanged;

  // Variables
  final List<T> items;
  final T selectedItem;

  @override
  _ScrollPickerState createState() => _ScrollPickerState<T>();
}

class _ScrollPickerState<T> extends State<ScrollPicker<T>> {

  // Constants
  static const double itemHeight = 50.0;

  // Variables
  late double widgetHeight;
  late int numberOfVisibleItems;
  late int numberOfPaddingRows;
  late double visibleItemsHeight;
  late double offset;

  late T selectedValue;

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    selectedValue = widget.selectedItem;
    int initialItem = widget.items.indexOf(selectedValue);
    scrollController = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    TextStyle? defaultStyle = themeData.textTheme.bodyText2;
    TextStyle? selectedStyle = themeData.textTheme.headline5
        ?.copyWith(color: const Color.fromARGB(212, 146, 84, 200));

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        widgetHeight = constraints.maxHeight;

        return Stack(
          children: <Widget>[
            GestureDetector(
              onTapUp: _itemTapped,
              child: ListWheelScrollView.useDelegate(
                childDelegate: ListWheelChildBuilderDelegate(
                    builder: (BuildContext context, int index) {
                  if (index < 0 || index > widget.items.length - 1) {
                    return null;
                  }

                  var value = widget.items[index];

                  final TextStyle? itemStyle =
                      (value == selectedValue) ? selectedStyle : defaultStyle;

                  return Center(
                    child: Text(
                      '$value',
                      style: itemStyle,
                    ),
                  );
                }),
                controller: scrollController,
                itemExtent: itemHeight,
                onSelectedItemChanged: _onSelectedItemChanged,
                physics: const FixedExtentScrollPhysics(),
              ),
            ),
            Center(
              child: Container(
                height: itemHeight,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: Color.fromARGB(212, 146, 84, 200), width: 1.0),
                    bottom: BorderSide(
                        color: Color.fromARGB(212, 146, 84, 200), width: 1.0),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _itemTapped(TapUpDetails details) {
    Offset position = details.localPosition;
    double center = widgetHeight / 2;
    double changeBy = position.dy - center;
    double newPosition = scrollController.offset + changeBy;

    // animate to and center on the selected item
    scrollController.animateTo(newPosition,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void _onSelectedItemChanged(int index) {
    T newValue = widget.items[index];
    if (newValue != selectedValue) {
      selectedValue = newValue;
      widget.onChanged(newValue);
    }
  }
}
