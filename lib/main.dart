import 'package:flutter/material.dart';
import 'details.dart';
import 'header.dart';
import 'constants.dart'; // Import the constants file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(weddingTitle),
          backgroundColor: appBarColor,
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            bool isWideScreen = MediaQuery.of(context).size.width >
                MediaQuery.of(context).size.height;
            return Container(
              decoration: BoxDecoration(
                border: isWideScreen
                    ? const Border(
                        left: BorderSide(color: appBarColor, width: borderWidth),
                        right: BorderSide(color: appBarColor, width: borderWidth),
                      )
                    : null,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    WeddingHeader(),
                    WeddingDetails(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
