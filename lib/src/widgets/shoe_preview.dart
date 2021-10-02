import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shoes/src/models/shoe_model.dart';
import 'package:shoes/src/pages/shoe_detail_page.dart';

class ShoePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoePreview({
    Key? key,
    this.fullScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const ShoeDetailPage(),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 25,
          vertical: (fullScreen) ? 5 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xFFFFCF53),
            borderRadius: (!fullScreen)
                ? BorderRadius.circular(50)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
          ),
          child: Column(
            children: <Widget>[
              const _ShoeShadow(),
              if (!fullScreen) const _ShoeSizes(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: <Widget>[
          const Positioned(
            bottom: 30,
            right: 0,
            child: _Shadow(),
          ),
          Image(image: AssetImage(shoeModel.assetImage)),
        ],
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  const _Shadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 180,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFEAA14E),
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          _SizeBox(size: 7),
          _SizeBox(size: 7.5),
          _SizeBox(size: 8),
          _SizeBox(size: 8.5),
          _SizeBox(size: 9),
          _SizeBox(size: 9.5),
        ],
      ),
    );
  }
}

class _SizeBox extends StatelessWidget {
  final double size;

  const _SizeBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () {
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.size = size;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        child: Text(
          '$size',
          style: TextStyle(
            color: (size == shoeModel.size)
                ? Colors.white
                : const Color(0xFFEAA14E),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color:
              (size == shoeModel.size) ? const Color(0xFFEAA14E) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (size == shoeModel.size)
              const BoxShadow(
                color: Color(0xFFF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
        ),
      ),
    );
  }
}
