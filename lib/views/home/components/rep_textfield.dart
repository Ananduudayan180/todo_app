import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_str.dart';

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.controller,
    this.isForDescription = false,
  });

  final TextEditingController controller;
  final bool isForDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      //TextField
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDescription ? 5 : null,
          cursorHeight: !isForDescription ? 50 : null,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: isForDescription ? InputBorder.none : null,
            counter: Container(),
            hintText: isForDescription ? AppStr.addNote : null,
            prefixIcon: isForDescription
                ? Icon(Icons.bookmark_border, color: Colors.grey)
                : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {},
        ),
      ),
    );
  }
}
