import 'package:flutter/material.dart';

class input extends StatelessWidget {
  final controller;
  final String hintText;
  const input({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    final hei = MediaQuery.of(context).size.height;
    return Container(
      width: wid < 400
          ? wid < 340
              ? 40
              : wid / 8
          : 55,
      height: hei / 19,
      child: TextField(
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
    );
  }
}
