import 'package:flutter/material.dart';
import 'package:frutflix/widgets/widgets.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required String topTagText,
    required String bottomTagTitle,
    String? bottomTagSubtitle,
    String? bottomTagDescription,
    String? networkImageUrl,
  })  : _topTagText = topTagText,
        _bottomTagTitle = bottomTagTitle,
        _bottomTagSubtitle = bottomTagSubtitle,
        _bottomTagDescription = bottomTagDescription,
        _networkImageUrl = networkImageUrl,
        super(key: key);

  final String _topTagText;
  final String _bottomTagTitle;
  final String? _bottomTagSubtitle;
  final String? _bottomTagDescription;
  final String? _networkImageUrl;

  @override
  Widget build(BuildContext context) {
    return ContainerWithShadow(
      children: [
        _TopTag(topTagText: _topTagText),
        _BottomTag(
          bottomTagTitle: _bottomTagTitle,
          bottomTagSubtitle: _bottomTagSubtitle,
          bottomTagDescription: _bottomTagDescription,
        ),
      ],
      networkImageUrl: _networkImageUrl,
    );
  }
}

class _TopTag extends StatelessWidget {
  const _TopTag({
    Key? key,
    required topTagText,
  })  : _topTagText = topTagText,
        super(key: key);
  final String _topTagText;
  final Radius _radius25 = const Radius.circular(25);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: _radius25,
              topRight: _radius25,
            ),
            color: Theme.of(context).primaryColor,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _topTagText,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          )),
    );
  }
}

class _BottomTag extends StatelessWidget {
  const _BottomTag({
    Key? key,
    required String bottomTagTitle,
    String? bottomTagSubtitle,
    String? bottomTagDescription,
  })  : _bottomTagTitle = bottomTagTitle,
        _bottomTagSubtitle = bottomTagSubtitle,
        _bottomTagDescription = bottomTagDescription,
        super(key: key);

  final Radius _radius25 = const Radius.circular(25);
  final String _bottomTagTitle;
  final String? _bottomTagSubtitle;
  final String? _bottomTagDescription;

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 80,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: _radius25,
            topRight: _radius25,
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            _bottomTagTitle,
            style: _textTheme.headline4!.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (_bottomTagSubtitle != null)
            Text(
              _bottomTagSubtitle!,
              style: _textTheme.headline5!
                  .copyWith(color: Colors.white, fontSize: 14),
            ),
          if (_bottomTagDescription != null)
            Text(
              _bottomTagDescription!,
              style: _textTheme.headline5!
                  .copyWith(color: Colors.white, fontSize: 12),
            ),
        ]),
      ),
    );
  }
}
