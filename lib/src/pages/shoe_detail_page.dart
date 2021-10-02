import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import 'package:shoes/src/helpers/helpers.dart';
import 'package:shoes/src/models/shoe_model.dart';
import 'package:shoes/src/widgets/custom_widgets.dart';

class ShoeDetailPage extends StatelessWidget {
  const ShoeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              const Hero(
                tag: 'shoe',
                child: ShoePreview(fullScreen: true),
              ),
              Positioned(
                top: 40,
                child: FloatingActionButton(
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const <Widget>[
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _BuyNow(),
                  _Colors(),
                  _ButtonOptions(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonOptions extends StatelessWidget {
  const _ButtonOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const _Option(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ),
          ),
          _Option(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _Option(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final Icon icon;

  const _Option({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
    );
  }
}

class _Colors extends StatelessWidget {
  const _Colors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: const <Widget>[
                Positioned(
                  left: 90,
                  child: _ButtonColor(
                    color: Color(0xFFC6D642),
                    index: 4,
                    assetImage: 'assets/img/verde.png',
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _ButtonColor(
                    color: Color(0xFFDDAD29),
                    index: 3,
                    assetImage: 'assets/img/amarillo.png',
                  ),
                ),
                Positioned(
                  left: 30,
                  child: _ButtonColor(
                    color: Color(0xFF2099F1),
                    index: 2,
                    assetImage: 'assets/img/azul.png',
                  ),
                ),
                _ButtonColor(
                  color: Color(0xFF364D56),
                  index: 1,
                  assetImage: 'assets/img/negro.png',
                ),
              ],
            ),
          ),
          const OrangeButton(
            text: 'More related items',
            height: 30,
            width: 170,
            color: Color(0xFFFFC675),
          ),
        ],
      ),
    );
  }
}

class _ButtonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String assetImage;

  const _ButtonColor({
    Key? key,
    required this.color,
    required this.index,
    required this.assetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = assetImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  const _BuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            const Text(
              '\$180',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const OrangeButton(
                text: 'Buy now',
                width: 120,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
