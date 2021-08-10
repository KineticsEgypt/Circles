import 'package:flutter/material.dart';
class ALoading extends StatelessWidget {
  final double strokeWidth;

  const ALoading({Key key, this.strokeWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 4,
      ),
    );
  }
}
