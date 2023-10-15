import 'package:flutter/material.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/builder_widgets/ui_item_widget.dart';
import 'package:json_dynamic_ui/common_utils/ui_builder/models/widget_ui_model.dart';

class HorizontalListWidget extends StatelessWidget {
  final WidgetUIModel widgetModel;
  static const listHeight = 150.0;

  const HorizontalListWidget({required this.widgetModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widgetModel.title!,style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
          SizedBox(
            height: listHeight,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widgetModel.items?.length,
                itemBuilder: (_, index) {
                  return UIItemWidget(
                    itemModel: widgetModel.items![index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
