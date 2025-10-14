import 'package:dropdown_button2/dropdown_button2.dart';
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
    {'fruit': 'Orange', 'color': Colors.orange},
    {'fruit': 'Mango', 'color': Colors.amber},
  ];

  Color selectedColor = Colors.red; // Default color for 'Apple'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Dropdown Example')),
      body: Center(
        child: Container(
          width: 1300,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              value: selectedValue,
              hint: Text('Select Fruit'),
              isExpanded: true,
              style: const TextStyle(color: Colors.black, fontSize: 18),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  selectedColor = items.firstWhere(
                    (item) => item['fruit'] == newValue,
                  )['color'];
                });
              },
              buttonStyleData: ButtonStyleData(
                height: 50,
                width: 180,
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                direction:
                    DropdownDirection.left, // 👈 Force dropdown to open DOWN
                maxHeight: 200, // limit height
                decoration: BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              items: items.map<DropdownMenuItem<String>>((mp) {
                return DropdownMenuItem<String>(
                  value: mp['fruit'],
                  child: Row(
                    children: [
                      CircleAvatar(backgroundColor: mp['color'], radius: 8),
                      const SizedBox(width: 10),
                      Text(mp['fruit']),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
