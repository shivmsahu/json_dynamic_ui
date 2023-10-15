import 'package:flutter/material.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/builder_widgets/scaffold_body_widget.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/constants/ui_model_keys.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/constants/ui_string_constants.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/models/root_ui_model.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/widgets/common_error_widget.dart';

class RootUiWidget extends StatelessWidget {
  final RootUiModel? uiModel;

  const RootUiWidget({required this.uiModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: uiModel?.app?.theme == UIThemeKeys.light
              ? Brightness.light
              : Brightness.dark),
      home: uiModel == null
          ? const CommonErrorWidget(
              errorText: UIStringConstants.uiDataNotAvailable)
          : ScaffoldBodyWidget(widgetsList: uiModel?.widgets ?? []),
    );
  }
}
