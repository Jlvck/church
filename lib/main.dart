// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/hymn_book.dart';
import 'screens/hymn_book_screen.dart';
import 'widgets/hymn_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => HymnBook(),
      child: MaterialApp(
        home: MyHomePage(),
        routes: {
          HymnBookScreen.routeName: (ctx) => HymnBookScreen(),
          HymnView.routeName: (ctx) => HymnView()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String logo_1 = 'images/church_logo1.png';
  String logo_2 = 'images/church_logo2.png';

  String name = 'images/church_logo2.png';

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    double maxHeight = mediaQuery.size.height -
        AppBar().preferredSize.height -
        mediaQuery.padding.top;
    double maxWidth = mediaQuery.size.width;
    return Scaffold(
        // backgroundColor: Colors.purple,
        appBar: AppBar(title: Text('GAC')),
        body: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
            maxWidth: maxWidth,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: maxHeight * 0.5,
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      name,
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                    )),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black54),
                    child: IconButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(HymnBookScreen.routeName),
                      icon: Icon(Icons.navigate_next),
                      color: Colors.blue,
                    ),
                  ))
            ],
          ),
        ));
  }
}
