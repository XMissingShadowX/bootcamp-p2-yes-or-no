import 'package:flutter/material.dart';

import '../../domain/message.dart';

class OtherMessageBubble extends StatelessWidget {
  final Message message;
  const OtherMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: colorScheme.secondary,
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
        SizedBox(height: 10),
        _ImageBubble(image: message.imageUrl!)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;

  const _ImageBubble({required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        image,
        width: size.width * .7,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child;
          return Container(
            width: size.width * .7,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text("La otra persona esta buscando una imagen algo."),
          );
        },
      ),
    );
  }
}













