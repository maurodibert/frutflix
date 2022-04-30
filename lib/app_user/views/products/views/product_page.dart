import 'package:flutter/material.dart';
import 'package:frutflix/widgets/widgets.dart';
import 'package:frutflix/utils/utils.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.primaries[0],
          child: const Icon(
            Icons.abc_outlined,
          ),
          onPressed: () {},
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            _ProductHeader(size: _size, radius: _radius),
            const _ProductForm(),
            ...gapH48.multiplyBy(2),
          ]),
        ));
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({Key? key}) : super(key: key);
  final BoxDecoration _boxDecoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Sizes.p24),
      decoration: _boxDecoration,
      child: Form(
        child: Column(
          children: [
            gapH12,
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nombre del producto',
                labelText: 'Nombre:',
              ),
            ),
            gapH12,
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Precio del producto',
                labelText: 'Precio:',
              ),
            ),
            gapH24,
            SwitchListTile(
                title: const Text('Disponible'),
                activeColor: Colors.primaries[0],
                value: true,
                onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}

class _ProductHeader extends StatelessWidget {
  const _ProductHeader({
    Key? key,
    required Size size,
    required BorderRadius radius,
  })  : _size = size,
        _radius = radius,
        super(key: key);

  final Size _size;
  final BorderRadius _radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
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
