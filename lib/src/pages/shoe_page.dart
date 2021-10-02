import 'package:flutter/material.dart';

import 'package:shoes/src/helpers/helpers.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusDark();

    return Scaffold(
      body: Column(
        children: <Widget>[
          const CustomAppBar(
            title: 'For you',
            icon: Icons.search,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const <Widget>[
                  Hero(
                    tag: 'shoe',
                    child: ShoePreview(),
                  ),
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          const CartButton(total: 180.0),
        ],
      ),
    );
  }
}
