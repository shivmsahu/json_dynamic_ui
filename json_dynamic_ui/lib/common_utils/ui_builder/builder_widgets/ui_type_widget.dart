import 'package:flutter/material.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/builder_widgets/banner_carousal_widget.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/builder_widgets/banner_widget.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/builder_widgets/horizontal_list_widget.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/constants/ui_model_keys.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/constants/ui_string_constants.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/models/widget_ui_model.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/widgets/common_error_widget.dart';

class UITypeWidget extends StatelessWidget {
  final WidgetUIModel widgetModel;

  const UITypeWidget({required this.widgetModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!widgetModel.isValid) {
      return const CommonErrorWidget(
        errorText: UIStringConstants.invalidUIDataProvided,
      );
    }
    switch (widgetModel.type) {
      case UITypeKeys.banner:
        return BannerWidget(widgetModel: widgetModel);
      case UITypeKeys.horizontalList:
        return HorizontalListWidget(widgetModel: widgetModel);
      case UITypeKeys.bannerCarousal:
        return BannerCarousalWidget(widgetModel: widgetModel);
      default:
        return const CommonErrorWidget(
          errorText: UIStringConstants.invalidTypeProvided,
        );
    }
  }
}
