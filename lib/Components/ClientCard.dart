import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatefulWidget {
  final String clientName;
  final VoidCallback onPressed;

  const ClientCard({super.key, required this.clientName, required this.onPressed});

  @override
  _ClientCardState createState() => _ClientCardState();
}

class _ClientCardState extends State<ClientCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
                child: const Center(child: Text('AS', style: TextStyle(color: Colors.white),)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,  right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('cc-5', style: TextStyle(fontSize: 12, color: Colors.black54,)),
                        GestureDetector(
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                          ),
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(widget.clientName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 15, color: Colors.black54,),
                        Text(' 1234 Main St, City, State 12345', style: TextStyle(fontSize: 12, color: Colors.black54,)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}