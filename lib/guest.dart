import 'package:flutter/material.dart';

class Guest {
  String? name;
  int? age;
  String? accommodations;

  Guest({
    this.name,
    this.age,
    this.accommodations,
  });
}

class GuestDetails extends StatelessWidget {
  final Guest guest;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<int?> onAgeChanged;
  final ValueChanged<String> onAccommodationsChanged;

  const GuestDetails({
    required this.guest,
    required this.onNameChanged,
    required this.onAgeChanged,
    required this.onAccommodationsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Name'),
          controller: TextEditingController(text: guest.name),
          onChanged: onNameChanged,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Age'),
          controller: TextEditingController(text: guest.age?.toString()),
          keyboardType: TextInputType.number,
          onChanged: (value) => onAgeChanged(int.tryParse(value)),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Accommodations'),
          controller: TextEditingController(text: guest.accommodations),
          onChanged: onAccommodationsChanged,
        ),
      ],
    );
  }
}
