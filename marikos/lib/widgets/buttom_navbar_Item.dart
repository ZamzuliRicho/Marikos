import 'package:flutter/material.dart';
import 'package:marikos/theme.dart';

class bottomNavbarItem extends StatelessWidget {
  final String? imageUrl;
  final bool? isActive;

  bottomNavbarItem({this.imageUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl!,
          width: 26,
        ),
        Spacer(),
        isActive!
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(1000),
                    )),
              )
            : Container()
      ],
    );
  }
}
