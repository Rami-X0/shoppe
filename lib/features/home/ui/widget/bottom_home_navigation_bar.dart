import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe/core/theming/colors.dart';

class BottomHomeNavigationBar extends StatefulWidget {
  const BottomHomeNavigationBar({super.key});

  @override
  State<BottomHomeNavigationBar> createState() =>
      _BottomHomeNavigationBarState();
}

class _BottomHomeNavigationBarState extends State<BottomHomeNavigationBar> {
  int _selectIndex = 0;

  final Radius radius = const Radius.circular(20);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topRight: radius, topLeft: radius),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
         selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedItemColor: ColorsManager.mainBlue.withOpacity(0.7),
          currentIndex: _selectIndex,
          type: BottomNavigationBarType.shifting,
          onTap: _onSelectedItem,
          elevation: 5,
          items: [
            _bottomNavigationItem(
              fontAwesomeIcons: FontAwesomeIcons.house,
            ),
            _bottomNavigationItem(
              fontAwesomeIcons: FontAwesomeIcons.gratipay,
            ),
            _bottomNavigationItem(
              fontAwesomeIcons: FontAwesomeIcons.basketShopping,
            ),
            _bottomNavigationItem(
                fontAwesomeIcons: FontAwesomeIcons.magnifyingGlass),
            _bottomNavigationItem(
              fontAwesomeIcons: FontAwesomeIcons.gear,
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectedItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  BottomNavigationBarItem _bottomNavigationItem({
    required IconData fontAwesomeIcons,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        fontAwesomeIcons,
        size: 22.w,
      ),
      label: '',

      backgroundColor: ColorsManager.mainBlue.withOpacity(0.3),
    );
  }
}
