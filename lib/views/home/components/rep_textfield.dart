import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_str.dart';

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.controller,
    this.isForDescription = false,
    required this.onFieldSubmitted,
    required this.onChanged,
  });

  final TextEditingController? controller;
  final bool isForDescription;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDescription ? 5 : null,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            border: isForDescription ? InputBorder.none : null,
            counter: Container(),
            hintText: isForDescription ? AppStr.addNote : null,
            prefixIcon: isForDescription
                ? const Icon(Icons.bookmark_border)
                : null,
          ),
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
