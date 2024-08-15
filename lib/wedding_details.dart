import 'package:flutter/material.dart';
import 'constants.dart';
import 'rsvp.dart';

class WeddingDetails extends StatelessWidget {
  const WeddingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/floral_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(paddingValue),
          child: Column(
            children: [
              const Text(
                ceremonyTime,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      MediaQuery.of(context).size.height * spacingFactor * 1.5),
              const Text(
                receptionInfo,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      MediaQuery.of(context).size.height * spacingFactor * 1.5),
              RSVPForm(),
            ],
          ),
        ),
      ),
    );
  }
}
