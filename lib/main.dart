import 'package:flutter/material.dart';
import 'package:lab5/Item.dart';
import 'package:provider/provider.dart';
import 'Item.dart';
import 'home.dart';
void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: MaterialApp(
        
        home: MainScaffold(),
        debugShowCheckedModeBanner: false,
      ),
      
    );
  }
}