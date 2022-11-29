import 'package:flutter/material.dart';

import 'screens/main_task/main_task.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (_) => const MainTask(),
      },
    ));
