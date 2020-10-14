import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/home/home_page.dart';
import 'model/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BoraBora Island',
      home: new ChangeNotifierProvider<Data>(
        create: (_) => new Data(),
        child: new HomePage(),
      ),
    );
  }
}
