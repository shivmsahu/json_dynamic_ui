import 'package:json_dynamic_ui/common_utils/ui_builder/constants/ui_model_keys.dart';

class WidgetUIModel {
  WidgetUIModel({
    this.type,
    this.title,
    this.text,
    this.items,
    this.image,
    this.color,
    this.headerText,
    this.footerText,
    this.footerIcon,
    this.padding,
    this.margin,
    this.borderRadius,
  });

  bool get isValid {
    switch (type) {
      case UITypeKeys.banner:
        return headerText != null &&
            footerText != null &&
            footerIcon != null &&
            (image != null || color != null);

      case UITypeKeys.horizontalList:
        return title != null && items != null;

      case UITypeKeys.bannerCarousal:
        return items != null;
      case UITypeKeys.boxItem:
      case UITypeKeys.circularItem:
        return text != null && image != null;
      default:
        return false;
    }
  }

  WidgetUIModel.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'];
    text = json['text'];
    image = json['image'];
    color = json['color'];
    headerText = json['header_text'];
    footerText = json['footer_text'];
    footerIcon = json['footer_icon'];
    padding = json['padding'];
    margin = json['margin'];
    borderRadius = json['border_radius'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(WidgetUIModel.fromJson(v));
      });
    }
  }

  String? type;
  String? title;
  String? text;
  List<WidgetUIModel>? items;
  String? image;
  String? color;
  String? headerText;
  String? footerText;
  num? padding;
  num? margin;
  num? borderRadius;
  bool? footerIcon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['title'] = title;
    map['text'] = text;
    map['image'] = image;
    map['color'] = color;
    map['header_text'] = headerText;
    map['footer_text'] = footerText;
    map['footer_icon'] = footerIcon;
    map['padding'] = padding;
    map['margin'] = margin;
    map['border_radius'] = borderRadius;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
