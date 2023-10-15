import 'package:flutter/material.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/builder_widgets/ui_type_widget.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/constants/ui_string_constants.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/models/widget_ui_model.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/widgets/common_error_widget.dart';

class ScaffoldBodyWidget extends StatelessWidget {
  final List<WidgetUIModel> widgetsList;

  const ScaffoldBodyWidget({required this.widgetsList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (widgetsList.isEmpty) {
      return const CommonErrorWidget(
          errorText: UIStringConstants.noWidgetsScaffold);
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              widgetsList.length,
              (index) => UITypeWidget(
                widgetModel: widgetsList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
