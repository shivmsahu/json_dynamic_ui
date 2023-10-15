import 'package:json_dynamic_ui/common_utils/ui_builder/models/app_ui_model.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/models/widget_ui_model.dart';

class RootUiModel {
  RootUiModel({
    this.app,
    this.widgets,
  });

  RootUiModel.fromJson(dynamic json) {
    app = json['app'] != null ? AppUIModel.fromJson(json['app']) : null;
    if (json['widgets'] != null) {
      widgets = [];
      json['widgets'].forEach((v) {
        widgets?.add(WidgetUIModel.fromJson(v));
      });
    }
  }

  AppUIModel? app;
  List<WidgetUIModel>? widgets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (app != null) {
      map['app'] = app?.toJson();
    }
    if (widgets != null) {
      map['widgets'] = widgets?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}






