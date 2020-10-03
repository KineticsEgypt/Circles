import 'package:flutter/material.dart';
class CTextFormField extends StatelessWidget {
  final TextInputType textInputType;
  final TextEditingController controller;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final TextAlign textAlign;
  final double width;

  const CTextFormField({
    Key key,
    this.textInputType,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.width,
    this.textAlign
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white38
      ),
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        obscureText: obscureText,
        textAlign: textAlign,
        maxLines: textInputType == TextInputType.multiline ? null : 1,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIconConstraints: BoxConstraints(
              maxHeight: 24,
              minWidth: 32
          ),
          suffixIconConstraints: BoxConstraints(
              maxHeight: 24,
              minWidth: 32
          ),
        ),
      ),
    );
  }
}
