import 'package:flutter/material.dart';

import 'constants.dart';

class Guest {
  String? name;
  int? age;
  String? accommodations;

  Guest({this.name, this.age, this.accommodations});
}

class GuestDetails extends StatelessWidget {
  final Guest guest;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<int?> onAgeChanged;
  final ValueChanged<String> onAccommodationsChanged;
  final VoidCallback onRemove;

  const GuestDetails({super.key, 
    required this.guest,
    required this.onNameChanged,
    required this.onAgeChanged,
    required this.onAccommodationsChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(paddingValue),
      margin: const EdgeInsets.symmetric(vertical: textFieldSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            controller: TextEditingController(text: guest.name),
            onChanged: onNameChanged,
          ),
          const SizedBox(height: textFieldSpacing),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Age',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            controller: TextEditingController(text: guest.age?.toString()),
            keyboardType: TextInputType.number,
            onChanged: (value) => onAgeChanged(int.tryParse(value)),
          ),
          const SizedBox(height: textFieldSpacing),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Accommodations',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            controller: TextEditingController(text: guest.accommodations),
            onChanged: onAccommodationsChanged,
          ),
          const SizedBox(height: buttonSpacing),
          ElevatedButton(
            onPressed: onRemove,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.pinkAccent,
            ),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }
}
