import 'package:flutter/material.dart';
import 'package:frutflix/widgets/widgets.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);
  static const String routeName = 'product';

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    const BorderRadius _radius = BorderRadius.only(
      topLeft: Radius.circular(45),
      topRight: Radius.circular(45),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            ContainerWithShadow(
              padding: const EdgeInsets.fromLTRB(10, 10, 8, 0),
              height: _size.height * 0.5,
              networkImageUrl: 'https://via.placeholder.com/400x300/green',
              assetImage: 'assets/images/no_image.png',
              radius: _radius,
              shadows: const [],
              children: const [SizedBox.shrink()],
            ),
            _Icon(
                icon: Icons.arrow_back_ios_new,
                goesLeft: true,
                onPressed: () => Navigator.pop(context)),
            _Icon(
                icon: Icons.camera_alt_outlined,
                goesLeft: false,
                onPressed: () => Navigator.pop(context)),
          ],
        )
      ]),
    ));
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    required icon,
    required goesLeft,
    required onPressed,
    Key? key,
  })  : _icon = icon,
        _goesLeft = goesLeft,
        _onPressed = onPressed,
        super(key: key);
  final IconData _icon;
  final bool _goesLeft;
  final Function _onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 60,
        left: _goesLeft ? 30 : null,
        right: !_goesLeft ? 30 : null,
        child: IconButton(
          onPressed: () => _onPressed(),
          icon: Icon(
            _icon,
            size: 40,
            color: Colors.white,
          ),
        ));
  }
}
