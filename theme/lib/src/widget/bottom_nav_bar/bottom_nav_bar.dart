import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBarState with ChangeNotifier {
  bool _isVisible = true;
  bool get isVisible => _isVisible;

  void hide() {
    _isVisible = false;
    notifyListeners();
  }

  void show() {
    _isVisible = true;
    notifyListeners();
  }

  void toggle() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}

class BottomNavBar extends StatefulWidget {
  static BottomNavBarState of(BuildContext context) => context.read();

  const BottomNavBar({
    Key? key,
    required this.items,
    this.selectedIndex = 0,
    this.onIndexChange,
    this.backgroundColor,
  }) : super(key: key);

  final List<BottomNavBarItem> items;

  final int selectedIndex;
  final void Function(int)? onIndexChange;

  final Color? backgroundColor;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int indexSelected = 0;

  @override
  void didUpdateWidget(covariant BottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      indexSelected = widget.selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bgColor = widget.backgroundColor ?? Theme.of(context).primaryColor;
    var indexList = List.generate(widget.items.length, (index) => index);

    return ChangeNotifierProvider(
      create: (context) => BottomNavBarState(),
      builder: (context, child) {
        var state = context.watch<BottomNavBarState>();
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: state.isVisible ? 56 : 0,
          color: bgColor,
          child: child,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: indexList
                  .map(
                    (index) => BottomNavBarItemWidget(
                      index: index,
                      item: widget.items[index],
                      isSelected: index == indexSelected,
                      onTap: (index) => setState(() {
                        indexSelected = index;
                        widget.onIndexChange?.call((indexSelected));
                      }),
                      backgroundColor: bgColor,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarItemWidget extends StatelessWidget {
  const BottomNavBarItemWidget({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.item,
    required this.onTap,
    required this.backgroundColor,
  }) : super(key: key);

  final int index;
  final bool isSelected;
  final BottomNavBarItem item;
  final Color backgroundColor;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: () {
            onTap(index);
          },
          child: Container(
            height: 56,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconTheme(
                    data: IconThemeData(
                      size: item.iconSize,
                      color: isSelected
                          ? item.activeColor.withOpacity(1)
                          : item.inactiveColor,
                    ),
                    child: item.icon,
                  ),
                  DefaultTextStyle.merge(
                    style: TextStyle(
                      fontSize: item.fontSize,
                      color: isSelected ? item.activeColor : item.inactiveColor,
                    ),
                    maxLines: 1,
                    child: item.title,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarItem {
  BottomNavBarItem({
    required this.icon,
    this.iconSize = 32,
    required this.title,
    this.fontSize = 10,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
  });

  final Icon icon;
  final double iconSize;
  final double fontSize;
  final Widget title;
  final Color activeColor;
  final Color inactiveColor;
}
