import 'package:flutter/material.dart';

class BannerTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Widget? trailingIcon;

  const BannerTextWidget(
      {required this.text,
      this.trailingIcon,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(
              width: 12,
            ),
            trailingIcon!
          ]
        ],
      ),
    );
  }
}
