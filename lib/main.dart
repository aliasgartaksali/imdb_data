import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/MainScreen.dart';
import './providers/movies.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Movies(),
        ),
      ],
      child: MaterialApp(
        title: 'IMDb',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(),
        home: MainScreen(),
      ),
    );
  }
}
