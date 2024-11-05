import 'package:flutter/material.dart';

class InputValues extends StatelessWidget {
  final String text;
  final String text2;
  final TextEditingController controller;
  const InputValues({super.key, required this.text, required this.text2, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: text,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 1,
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child:  Text(
              text2,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
