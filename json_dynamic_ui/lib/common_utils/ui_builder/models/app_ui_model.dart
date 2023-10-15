class AppUIModel {
  AppUIModel({
    this.theme,
  });

  AppUIModel.fromJson(dynamic json) {
    theme = json['theme'];
  }

  String? theme;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['theme'] = theme;
    return map;
  }
}