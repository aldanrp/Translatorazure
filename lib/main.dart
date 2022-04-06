import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/Homepage.dart';
import 'services/translate_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TranlatorsProviders(),
        )
      ],
      builder: (context, child) => const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
