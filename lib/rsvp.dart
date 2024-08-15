import 'package:flutter/material.dart';
import 'guest_details.dart';

class RSVPForm extends StatefulWidget {
  const RSVPForm({super.key});

  @override
  RSVPFormState createState() => RSVPFormState();
}

class RSVPFormState extends State<RSVPForm> {
  final List<Guest> _guests = [
    Guest(name: '', age: null, accommodations: ''),
  ];

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
    if (_guests.last.name != null ||
        _guests.last.age != null ||
        _guests.last.accommodations != null) {
      _guests.add(Guest(name: '', age: null, accommodations: ''));
    }
  }

  void _removeGuest(int index) {
    setState(() {
      _guests.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5, // Adjust the height as needed
      child: ListView.builder(
        itemCount: _guests.length,
        itemBuilder: (context, index) {
          return GuestDetails(
            guest: _guests[index],
            onNameChanged: (name) => _updateGuestName(index, name),
            onAgeChanged: (age) => _updateGuestAge(index, age),
            onAccommodationsChanged: (accommodations) => _updateGuestAccommodations(index, accommodations),
            onRemove: () => _removeGuest(index),
          );
        },
      ),
    );
  }
}
