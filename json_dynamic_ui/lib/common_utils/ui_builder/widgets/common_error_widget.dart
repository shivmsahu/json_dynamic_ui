import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  final String errorText;

  const CommonErrorWidget({
    required this.errorText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorText));
  }
}