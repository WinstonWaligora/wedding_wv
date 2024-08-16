import 'package:flutter/material.dart';

import 'constants.dart';

class Guest {
  String? name;
  int? age;
  String? accommodations;

  Guest({this.name, this.age, this.accommodations});
}

class GuestDetails extends StatefulWidget {
  final Guest guest;
  final int guestNumber; // Add guest number
  final ValueChanged<String> onNameChanged;
  final ValueChanged<int?> onAgeChanged;
  final ValueChanged<String> onAccommodationsChanged;
  final VoidCallback onRemove;
  final bool canRemove;

  const GuestDetails({
    super.key,
    required this.guest,
    required this.guestNumber, // Add guest number
    required this.onNameChanged,
    required this.onAgeChanged,
    required this.onAccommodationsChanged,
    required this.onRemove,
    required this.canRemove,
  });

  @override
  _GuestDetailsState createState() => _GuestDetailsState();
}

class _GuestDetailsState extends State<GuestDetails> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _accommodationsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.guest.name);
    _ageController = TextEditingController(text: widget.guest.age?.toString());
    _accommodationsController =
        TextEditingController(text: widget.guest.accommodations);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _accommodationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: Colors.white),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Beloved Guest ${widget.guestNumber}', // Display guest number
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            if (widget.canRemove)
              ElevatedButton(
                onPressed: widget.onRemove,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pinkAccent,
                ),
                child: const Text('Remove'),
              ),
          ],
        ),
        const SizedBox(height: textFieldSpacing),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: const TextStyle(color: Colors.white),
          controller: _nameController,
          onChanged: widget.onNameChanged,
        ),
        const SizedBox(height: textFieldSpacing),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Age',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: const TextStyle(color: Colors.white),
          controller: _ageController,
          keyboardType: TextInputType.number,
          onChanged: (value) => widget.onAgeChanged(int.tryParse(value)),
        ),
        const SizedBox(height: textFieldSpacing),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Accommodations',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          style: const TextStyle(color: Colors.white),
          controller: _accommodationsController,
          onChanged: widget.onAccommodationsChanged,
        ),
        const Divider(color: Colors.white),
      ],
    );
  }
}
