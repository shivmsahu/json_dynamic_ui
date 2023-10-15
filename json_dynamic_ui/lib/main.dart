import 'package:flutter/material.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/builder_widgets/root_ui_widget.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/ui_builder_json_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UiBuilderJsonLoader.init();
  runApp(RootUiWidget(uiModel: UiBuilderJsonLoader.uiModel));
}
