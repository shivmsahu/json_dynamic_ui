import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/models/root_ui_model.dart';

class UiBuilderJsonLoader {
  UiBuilderJsonLoader._();

  static RootUiModel uiModel = RootUiModel();

  static Future<void> init() async {
    try {
      final jsonData = await loadJsonAsset();
      uiModel = RootUiModel.fromJson(jsonData);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  static Future<Map<String, dynamic>> loadJsonAsset() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/root.json');
    final data = jsonDecode(jsonString);
    return data;
  }
}
