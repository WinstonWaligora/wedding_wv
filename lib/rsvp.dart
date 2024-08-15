import 'package:flutter/material.dart';
import 'guest.dart';

class RSVP extends StatefulWidget {
  const RSVP({super.key});

  @override
  RSVPState createState() => RSVPState();
}

class RSVPState extends State<RSVP> {
  final List<Map<String, dynamic>> _guests = [
    {'name': '', 'age': '', 'accommodations': ''}
  ];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _updateGuest(int index, String field, String value) {
    setState(() {
      _guests[index][field] = value;

      // Add a new form if the last form is not empty
      if (_guests.last['name'].isNotEmpty ||
          _guests.last['age'].isNotEmpty ||
          _guests.last['accommodations'].isNotEmpty) {
        _guests.add({'name': '', 'age': '', 'accommodations': ''});
        _listKey.currentState?.insertItem(
          _guests.length - 1,
          duration: const Duration(seconds: 1), // Set the duration to 1 second
        );
      }

      // Remove the guest if its contents are empty and it's not the last guest
      if (_guests[index]['name'].isEmpty &&
          _guests[index]['age'].isEmpty &&
          _guests[index]['accommodations'].isEmpty) {
        final removedGuest = _guests.removeAt(index);
        _listKey.currentState?.removeItem(
          index,
          (context, animation) => SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: FadeTransition(
              opacity: animation,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 100),
              ),
            ),
          ),
          duration: const Duration(
              seconds: 1), // Set the duration for the removal animation
        );
      }
    });
  }

  void _submitRSVP() {
    // Handle RSVP submission logic here
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('RSVP Confirmation'),
        content: Text(
            'You have reserved for ${_guests.length - 1} ${_guests.length - 1 == 1 ? 'person' : 'people'}.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      height: (_guests.length * 250),
      child: Column(
        children: [
          AnimatedList(
            key: _listKey,
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // Prevent scrolling in AnimatedList
            initialItemCount: _guests.length,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Beloved Guest ${index + 1}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.white),
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
                      onChanged: (value) => _updateGuest(index, 'name', value),
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
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
                      onChanged: (value) => _updateGuest(index, 'age', value),
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Special Accommodations',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onChanged: (value) =>
                          _updateGuest(index, 'accommodations', value),
                    ),
                    const Divider(color: Colors.white, thickness: 1.0),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: _submitRSVP,
            child: const Text('Submit RSVP'),
          ),
        ],
      ),
    );
  }
}
