import 'package:flutter/material.dart';

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // Default selected value
  String selectedValue = 'Apple';

  // List of items in dropdown
  final List<Map<String, dynamic>> items = [
    {'fruit': 'Apple', 'color': Colors.red},
    {'fruit': 'Banana', 'color': Colors.yellow},
    {'fruit': 'Grapes', 'color': Colors.green},
    {'fruit': 'Orange', 'color': Colors.cyanAccent},
    {'fruit': 'Mango', 'color': Colors.blue},
  ];

  Color? selectedcolor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Dropdown Example')),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            elevation: 8,
            style: TextStyle(color: Colors.black, fontSize: 18),
            underline: SizedBox(), // removes default underline
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            dropdownColor: selectedcolor,
            items: items.map<DropdownMenuItem<String>>((
              Map<String, dynamic> mp,
            ) {
              return DropdownMenuItem<String>(
                onTap: () {
                  setState(() {
                    selectedcolor = mp['color'];
                  });
                },
                value: mp['fruit'].toString(),
                child: Text(mp['fruit']),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
