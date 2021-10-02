import 'package:flutter/material.dart';

import 'package:shoes/src/widgets/custom_widgets.dart';

class CartButton extends StatelessWidget {
  final double total;

  const CartButton({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 20),
            Text(
              '\$$total',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const OrangeButton(text: 'Add to cart'),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
