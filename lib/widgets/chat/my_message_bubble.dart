import 'package:flutter/material.dart';

import '../../domain/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  MyMessageBubble({super.key, required this.message });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10
              ),
              child: Text(
                  message.text,
                  style: TextStyle(color: Colors.white)
              ),
            )
        ),
        SizedBox(height: 5,)
      ],
    );
  }
}