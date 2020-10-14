import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_body.dart';
import 'package:borabora_island/model/data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _getAppBar(),
      body: new Stack(
        children: [
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/images/borabora5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Column(
            children: <Widget>[
              // new GradientAppBar('BoraBora'),
              HomePageBody(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: _getBottomAppBar(context),
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 67.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: new EdgeInsets.only(top: _statusBarHeight),
      height: barHeight + _statusBarHeight,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: <double>[0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: new Center(
        child: new Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}

AppBar _getAppBar() {
  return new AppBar(
    centerTitle: true,
    toolbarHeight: 67.0,
    title: new Text(
      'BoraBora',
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      ),
    ),
    flexibleSpace: new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            const Color(0xFF3366FF),
            const Color(0xFF00DDAA),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: <double>[0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
    ),
    actions: <Widget>[
      new IconButton(
        icon: Icon(Icons.account_circle_rounded),
        onPressed: () {},
      ),
    ],
    leading: new IconButton(
      icon: Icon(Icons.ac_unit),
      onPressed: () {},
    ),
  );
}

BottomNavigationBar _getBottomAppBar(BuildContext context) {
  Data _data = Provider.of<Data>(context);

  return BottomNavigationBar(
    currentIndex: _data.bottomIndex,
    onTap: (index) => _data.bottomIndex = index,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: new Icon(Icons.home),
        title: new Text('Home'),
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.airplanemode_on_rounded),
        title: new Text('Airplane'),
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.assistant_photo_rounded),
        title: new Text('Photo'),
      ),
    ],
  );
}
