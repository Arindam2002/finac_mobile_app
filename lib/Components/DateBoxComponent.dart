import 'package:flutter/material.dart';

class DateBox extends StatefulWidget {
  final String label;
  final DateTime date;
  final ValueChanged<DateTime?> onDateChanged;

  DateBox({
    required this.label,
    required this.date,
    required this.onDateChanged,
  });

  @override
  _DateBoxState createState() => _DateBoxState();
}

class _DateBoxState extends State<DateBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextStyle(color: Colors.black54)),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.date.toIso8601String().substring(0, 10)),

              GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: widget.date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(DateTime.now().year + 5),
                  );
                  if (date != null) {
                    widget.onDateChanged(date);
                  }
                },
                child: Icon(Icons.calendar_today),
              ),
            ],
          ),
        ),
      ],
    );
  }
}