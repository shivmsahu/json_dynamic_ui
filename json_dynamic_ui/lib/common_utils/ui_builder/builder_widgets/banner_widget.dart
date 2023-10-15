import 'package:flutter/material.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/models/widget_ui_model.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/utils/color_converter.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/widgets/banner_text_widget.dart';

class BannerWidget extends StatelessWidget {
  final WidgetUIModel widgetModel;

  const BannerWidget({required this.widgetModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - (widgetModel.margin ?? 0 * 2),
      padding: EdgeInsets.all(widgetModel.padding?.toDouble() ?? 0),
      margin: EdgeInsets.all(widgetModel.margin?.toDouble() ?? 0),
      decoration: BoxDecoration(
          color: ColorConverter.getColorFromString(widgetModel.color),
          image: widgetModel.image == null
              ? null
              : DecorationImage(
                  image: NetworkImage(
                    widgetModel.image!,
                  ),
                  fit: BoxFit.cover),
          borderRadius:
              BorderRadius.circular(widgetModel.borderRadius?.toDouble() ?? 0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widgetModel.headerText != null)
            BannerTextWidget(
              text: widgetModel.headerText!,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          const Spacer(),
          if (widgetModel.footerText != null)
            BannerTextWidget(
              text: widgetModel.footerText!,
              trailingIcon: (widgetModel.footerIcon ?? false)
                  ? const Icon(Icons.arrow_forward)
                  : null,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
        ],
      ),
    );
  }
}
