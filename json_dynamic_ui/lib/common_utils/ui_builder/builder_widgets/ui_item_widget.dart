import 'package:flutter/material.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/constants/ui_model_keys.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/constants/ui_string_constants.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/models/widget_ui_model.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/widgets/common_error_widget.dart';

class UIItemWidget extends StatelessWidget {
  final WidgetUIModel itemModel;

  const UIItemWidget({required this.itemModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!itemModel.isValid) {
      return const CommonErrorWidget(
        errorText: UIStringConstants.invalidUIDataProvided,
      );
    }
    const itemHeight = 100.0;
    switch (itemModel.type) {
      case UITypeKeys.boxItem:
      case UITypeKeys.circularItem:
        return Column(
          children: [
            Container(
              height: itemHeight,
              width: itemHeight,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      itemModel.type == UITypeKeys.boxItem
                          ? 16
                          : itemHeight / 2),
                  image: DecorationImage(
                      image: NetworkImage(itemModel.image!),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              itemModel.text!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        );
      default:
        return const CommonErrorWidget(
          errorText: UIStringConstants.invalidTypeProvided,
        );
    }
  }
}
