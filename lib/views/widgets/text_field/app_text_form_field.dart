import 'dart:ui';

import 'package:circles/views/app_style/app_style.dart';
import 'package:flutter/material.dart';
class ATextFormField extends StatelessWidget {
  final TextInputType textInputType;
  final TextEditingController controller;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final String label;
  final TextAlign textAlign;
  final double width;
  final Function(String) onSaved;
  final Function(String) validator;
  final Function(String) onChange;

  const ATextFormField({
    Key key,
    this.textInputType,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.width,
    this.textAlign,
    this.label,
    this.onSaved,
    this.validator,
    this.onChange
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme
                .primary.withOpacity(.3)
          ),
          child: TextFormField(
            onSaved: onSaved,
            onChanged: onChange,
            validator: validator,
            keyboardType: textInputType,
            controller: controller,
            obscureText: obscureText,
            textAlign: textAlign ?? TextAlign.start,
            maxLines: textInputType == TextInputType.multiline ? null : 1,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
