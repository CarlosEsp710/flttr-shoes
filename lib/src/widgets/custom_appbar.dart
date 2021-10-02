import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Icon(
              icon,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
