import 'package:flutter/material.dart';
import 'screens/template_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Template App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemplateScreen(viewKey: 'example', dataId: 'template_001'),
    );
  }
}
