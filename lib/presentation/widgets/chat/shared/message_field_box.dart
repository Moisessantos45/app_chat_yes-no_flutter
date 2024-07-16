import 'package:flutter/material.dart';

class MyMessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MyMessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final inputDecoraction = InputDecoration(
      hintText: "Escribe un mensaje",
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.blue)),
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final value = textController.value.text;
          textController.clear();
          if (!value.isEmpty) onValue(value);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoraction,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        if (!value.isEmpty) onValue(value);
      },
    );
  }
}
