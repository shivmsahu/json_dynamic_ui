import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/builder_widgets/banner_widget.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/constants/ui_string_constants.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/models/widget_ui_model.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/widgets/common_error_widget.dart';

class BannerCarousalWidget extends StatefulWidget {
  final WidgetUIModel widgetModel;

  const BannerCarousalWidget({required this.widgetModel, Key? key})
      : super(key: key);

  @override
  State<BannerCarousalWidget> createState() => _BannerCarousalWidgetState();
}

class _BannerCarousalWidgetState extends State<BannerCarousalWidget> {
  late PageController pageController;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 200,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (_, index) {
          var calcIndex = index % widget.widgetModel.items!.length;
          var item = widget.widgetModel.items![calcIndex];
          if (!item.isValid) {
            return const CommonErrorWidget(
              errorText: UIStringConstants.invalidUIDataProvided,
            );
          }
          return BannerWidget(widgetModel: item);
        },
      ),
    );
  }
}
