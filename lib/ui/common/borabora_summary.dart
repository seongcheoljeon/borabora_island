import 'package:flutter/material.dart';
import 'package:borabora_island/model/borabora.dart';
import 'package:borabora_island/ui/text_style.dart';
import 'package:borabora_island/ui/common/separator.dart';
import 'package:borabora_island/ui/detail/detail_page.dart';

class BoraboraSummary extends StatelessWidget {
  final BoraBora borabora;
  final bool horizontal;

  BoraboraSummary(this.borabora, {this.horizontal = true});

  BoraboraSummary.vertical(this.borabora) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new DetailPage(borabora),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  transitionDuration: new Duration(seconds: 1),
                ),
              )
          : null,
      child: new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            _boraboraCard(),
            _boraboraThumbnail(),
          ],
        ),
      ),
    );
  }

  Widget _boraboraThumbnail() {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: 'borabora-hero-${borabora.id}',
        child: new Container(
          height: 92.0,
          width: 92.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new AssetImage(borabora.image),
            ),
          ),
        ),
      ),
    );
  }

  Widget _boraboraValue({String value, String image}) {
    return new Container(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Image.asset(image, height: 12.0),
          new Container(width: 8.0),
          new Text(value, style: Style.smallTextStyle)
        ],
      ),
    );
  }

  Widget _boraboraCardContent() {
    return new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(borabora.name, style: Style.titleTextStyle),
          new Container(height: 8.0),
          new Text(borabora.location, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: _boraboraValue(
                  value: borabora.distance,
                  image: 'assets/icons/ic_distance.png',
                ),
                flex: horizontal ? 1 : 0,
              ),
              new Container(width: horizontal ? 8.0 : 32.0),
              new Expanded(
                child: _boraboraValue(
                  value: borabora.weather,
                  image: 'assets/icons/ic_weather.png',
                ),
                flex: horizontal ? 1 : 0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _boraboraCard() {
    return new Container(
      child: _boraboraCardContent(),
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? const EdgeInsets.only(left: 46.0)
          : const EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: Colors.black54,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          )
        ],
      ),
    );
  }
}
