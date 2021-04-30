import 'package:flutter/material.dart';

class buildFormTextField extends StatelessWidget {
  var hintText, onChanged, keyBoardType,
      maxLines = 1, inputFormater, maxLength, controller;

  buildFormTextField(
      {this.hintText,
      this.onChanged,
      this.keyBoardType,
      this.maxLines,
      this.inputFormater,
      this.maxLength,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        keyboardType: keyBoardType,
        maxLines: maxLines,
        maxLength: maxLength,
        inputFormatters: inputFormater,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
