import 'package:flutter/material.dart';
import 'guest_details.dart';

class RSVPForm extends StatefulWidget {
  const RSVPForm({super.key});

  @override
  RSVPFormState createState() => RSVPFormState();
}

class RSVPFormState extends State<RSVPForm>
    with SingleTickerProviderStateMixin {
  final List<Guest> _guests = [
    Guest(name: '', age: null, accommodations: ''),
  ];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateGuestName(int index, String name) {
    setState(() {
      _guests[index].name = name;
      _addNewGuestIfNeeded();
    });
  }

  void _updateGuestAge(int index, int? age) {
    setState(() {
      _guests[index].age = age;
      _addNewGuestIfNeeded();
    });
  }

  void _updateGuestAccommodations(int index, String accommodations) {
    setState(() {
      _guests[index].accommodations = accommodations;
      _addNewGuestIfNeeded();
    });
  }

  void _addNewGuestIfNeeded() {
    bool hasEmptyGuest = _guests.any((guest) =>
        guest.name?.isEmpty == true &&
        guest.age == null &&
        guest.accommodations?.isEmpty == true);

    if (!hasEmptyGuest) {
      _guests.add(Guest(name: '', age: null, accommodations: ''));
      _controller.forward(from: 0.0);
    }
  }

  void _removeGuest(int index) {
    setState(() {
      _guests.removeAt(index);
      _controller.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Column(
        children: List.generate(_guests.length, (index) {
          return GuestDetails(
            key: ValueKey(_guests[index]),
            guest: _guests[index],
            onNameChanged: (name) => _updateGuestName(index, name),
            onAgeChanged: (age) => _updateGuestAge(index, age),
            onAccommodationsChanged: (accommodations) =>
                _updateGuestAccommodations(index, accommodations),
            onRemove: () => _removeGuest(index),
            canRemove: _guests.length > 1 &&
                !(index == _guests.length - 1 &&
                    _guests[index].name?.isEmpty == true &&
                    _guests[index].age == null &&
                    _guests[index].accommodations?.isEmpty == true),
          );
        }),
      ),
    );
  }
}
