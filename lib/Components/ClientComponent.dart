import 'package:flutter/material.dart';

class ClientComponent extends StatelessWidget {
  const ClientComponent({
    super.key,
    required this.clientInitials,
    required this.clientName,
  });

  final String clientInitials;
  final String clientName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: Text(clientInitials, style: TextStyle(color: Colors.white, fontSize: 10),),
          radius: 12,
          backgroundColor: Colors.deepPurple,
        ),
        SizedBox(width: 8.0),
        Text(clientName),
      ],
    );
  }
}