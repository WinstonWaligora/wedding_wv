import 'package:flutter/material.dart';
import 'constants.dart';
import 'header.dart';
import 'wedding_details.dart';

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
                        left:
                            BorderSide(color: appBarColor, width: borderWidth),
                        right:
                            BorderSide(color: appBarColor, width: borderWidth),
                      )
                    : null,
              ),
              child: const SingleChildScrollView(
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
