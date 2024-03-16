import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearchChanged;

  SearchBarComponent({required this.controller, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, TextEditingValue value, child) {
        return TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Search',
            labelStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            suffixIcon: value.text.isEmpty
                ? null
                : IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clear();
                onSearchChanged('');
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
        );
      },
    );
  }
}