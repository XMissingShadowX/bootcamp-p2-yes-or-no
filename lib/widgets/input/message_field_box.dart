import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextEditingController textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.primary),
      borderRadius: BorderRadius.circular(15),
    );

    return TextFormField(
      controller: textController,
      onTapOutside: (event){
        focusNode.unfocus();
      },
      decoration: InputDecoration(
        hintText: "Finaliza con un ?",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          onPressed: () {
            onValue(textController.text);
            textController.clear();
            focusNode.requestFocus();
          },
          icon: Icon(Icons.send_outlined))
      ),
      onFieldSubmitted: (value){
        onValue(value);
        textController.clear();
        focusNode.requestFocus();

      },
    );
  }
}
