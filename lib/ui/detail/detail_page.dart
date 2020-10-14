import 'package:flutter/material.dart';
import 'package:borabora_island/model/borabora.dart';
import 'package:borabora_island/ui/common/separator.dart';
import 'package:borabora_island/ui/common/borabora_summary.dart';
import 'package:borabora_island/ui/text_style.dart';

class DetailPage extends StatelessWidget {
  final BoraBora borabora;

  DetailPage(this.borabora);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: Image.asset(
        borabora.image,
        fit: BoxFit.cover,
        height: 500.0,
      ),
      constraints: new BoxConstraints.expand(height: 495.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: const EdgeInsets.only(top: 350.0),
      height: 150.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            const Color.fromARGB(0x00, 0x73, 0x6A, 0xB7),
            // const Color.fromARGB(0xFF, 0x34, 0x46, 0xeb),
            Colors.white,
          ],
          stops: <double>[0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = 'Overview'.toUpperCase();

    return Container(
      child: new ListView(
        padding: const EdgeInsets.fromLTRB(0.0, 330.0, 0.0, 50.0),
        children: <Widget>[
          new BoraboraSummary(borabora, horizontal: false),
          new Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_overviewTitle,
                    style:
                        Style.headerTextStyle.copyWith(color: Colors.black54)),
                new Separator(),
                new Text(borabora.description,
                    style:
                        Style.commonTextStyle.copyWith(color: Colors.black87)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}
