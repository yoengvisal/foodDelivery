import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fooddelivery/pages/home_page.dart';
import 'package:fooddelivery/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    List itemIcons = [
      'assets/icons/home_icon.svg',
      'assets/icons/order_icon.svg',
      'assets/icons/bell_icon.svg',
      'assets/icons/profile_icon.svg'
    ];
    List itemText = [
      'home',
      'order',
      'notifications',
      'profile',
    ];
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: textWhite,
        border: Border(
          top: BorderSide(width: 2, color: textBlack.withOpacity(0.06)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(itemIcons.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    itemIcons[index],
                    width: 22,
                    color: pageIndex == index ? primary : textBlack,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    itemText[index],
                    style: TextStyle(
                      fontSize: 10,
                      color: pageIndex == index ? primary : textBlack,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePage(),
        Center(
          child: Text(
            'Order',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Center(
          child: Text(
            'Notification',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Center(
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
