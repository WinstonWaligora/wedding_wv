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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _updateGuestName(int index, String name) {
    setState(() {
      _guests[index].name = name;
      _addNewGuestIfNeeded();
      _removeEmptyGuestIfNeeded(index);
    });
  }

  void _updateGuestAge(int index, int? age) {
    setState(() {
      _guests[index].age = age;
      _addNewGuestIfNeeded();
      _removeEmptyGuestIfNeeded(index);
    });
  }

  void _updateGuestAccommodations(int index, String accommodations) {
    setState(() {
      _guests[index].accommodations = accommodations;
      _addNewGuestIfNeeded();
      _removeEmptyGuestIfNeeded(index);
    });
  }

  void _addNewGuestIfNeeded() {
    bool hasEmptyGuest = _guests.any((guest) =>
        guest.name?.isEmpty == true &&
        guest.age == null &&
        guest.accommodations?.isEmpty == true);

    if (!hasEmptyGuest) {
      _guests.add(Guest(name: '', age: null, accommodations: ''));
      _listKey.currentState?.insertItem(_guests.length - 1);
    }
  }

  void _removeEmptyGuestIfNeeded(int index) {
    if (index == _guests.length - 2 &&
        _guests[index].name?.isEmpty == true &&
        _guests[index].age == null &&
        _guests[index].accommodations?.isEmpty == true) {
      _guests.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: Container(),
        ),
      );
    }
  }

  void _removeGuest(int index) {
    final removedGuest = _guests.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: GuestDetails(
          key: ValueKey(removedGuest),
          guest: removedGuest,
          guestNumber: index + 1,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5, // Set a specific height
      child: AnimatedList(
        key: _listKey,
        initialItemCount: _guests.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: GuestDetails(
              key: ValueKey(_guests[index]),
              guest: _guests[index],
              guestNumber: index + 1, // Pass the guest number
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
            ),
          );
        },
      ),
    );
  }
}
