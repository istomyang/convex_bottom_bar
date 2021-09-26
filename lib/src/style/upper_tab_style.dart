import 'package:flutter/material.dart';

import '../item.dart';
import 'blend_image_icon.dart';
import 'inner_builder.dart';
import 'transition_container.dart';

/// Tab item are flipped when click.
class UpperTabStyle extends InnerBuilder {
  /// Curve for flip transition.
  final Curve curve;

  /// Create style builder.
  UpperTabStyle({
    required List<TabItem> items,
    required Color activeColor,
    required Color color,
    required this.curve,
  }) : super(items: items, activeColor: activeColor, color: color);

  int _preActivate = -1;

  @override
  Widget build(BuildContext context, int index, bool active) {

    var c = Curves.easeInOut;

    var pre = _preActivate;
    if (active) {
      _preActivate = index;
    }
    var item = items[index];
    var style = ofStyle(context);

    var textStyle = style.textStyle(activeColor);

    var noLabel = style.hideEmptyLabel && hasNoText(item);
    var icon = BlendImageIcon(
      active ? item.activeIcon ?? item.icon : item.icon,
      size: style.iconSize,
      color: item.blend ? Colors.white : null,
    );
    var children = noLabel
        ? <Widget>[icon]
        : <Widget>[icon, Text(item.title ?? '', style: textStyle)];

    if (active) {
      return TransitionContainer.upper(
        data: index,
        duration: Duration(milliseconds: 300),
        curve: c,
        child: Container(
          padding: EdgeInsets.only(bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: children,
          ),
        ),
      );
    }

    if (pre == index) {
      return TransitionContainer.upper(
        reverse: true,
        curve: c,
        duration: Duration(milliseconds: 300),
        child: Container(
          padding: EdgeInsets.only(bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: children,
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(bottom: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      ),
    );
  }
}

