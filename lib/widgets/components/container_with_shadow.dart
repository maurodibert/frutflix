import 'package:flutter/material.dart';

class ContainerWithShadow extends StatelessWidget {
  ContainerWithShadow({
    Key? key,
    required List<Widget> children,
    EdgeInsets? padding,
    double? width,
    double? height,
    Color? color,
    BorderRadius? radius,
    List<BoxShadow>? shadows,
    String? assetImage,
    String? networkImageUrl,
    BoxFit? boxFit,
  })  : _children = children,
        _padding = padding ?? EdgeInsets.all(25),
        _width = width ?? double.infinity,
        _height = height ?? 400.0,
        _color = color ?? Colors.white,
        _radius = radius ?? BorderRadius.circular(25),
        _shadows = shadows ??
            const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 6),
                  spreadRadius: 2,
                  blurRadius: 5)
            ],
        _assetImage = assetImage,
        _networkImageUrl = networkImageUrl,
        _boxFit = boxFit,
        super(key: key);

  final List<Widget> _children;
  final EdgeInsets _padding;
  final double _width;
  final double _height;
  final Color _color;
  final BorderRadius _radius;
  final List<BoxShadow> _shadows;
  final String? _assetImage;
  final String? _networkImageUrl;
  final BoxFit? _boxFit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: _radius,
          boxShadow: _shadows,
        ),
        child: Stack(
          children: [
            if (_networkImageUrl != null)
              SizedBox(
                height: _height,
                width: _width,
                child: ClipRRect(
                  borderRadius: _radius,
                  child: FadeInImage(
                    placeholder:
                        AssetImage(_assetImage ?? 'assets/images/no_image.png'),
                    image: NetworkImage(_networkImageUrl!),
                    fit: _boxFit ?? BoxFit.fill,
                  ),
                ),
              ),
            ..._children,
          ],
        ),
      ),
    );
  }
}
