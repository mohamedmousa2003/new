//As to return name of response
// اللي بتكون ظهره فوق اللي بجيب منه مصادر الاخبار

import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';

class TabItem extends StatelessWidget {
  // name found in class name source
  Sources source;

  bool isSelected;

  TabItem(this.source,
      this.isSelected,);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: theme.primaryColor,
            width: 1.5,
          )
      ),
      child: Text(source?.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : theme.primaryColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
