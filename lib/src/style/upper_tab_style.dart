import 'package:flutter/material.dart';

import '../../convex_bottom_bar.dart';
import '../item.dart';
import 'transition_container.dart';

/// Tab item are flipped when click.
class UpperTabStyle extends DelegateBuilder {
  /// Curve for flip transition.
  final Curve curve;

  /// Duration of Items in vertical
  final int duration;

  /// Create widget with function
  final List<GetWidget> gets;

  /// Create style builder.
  UpperTabStyle({
    required this.gets,
    required this.curve,
    required this.duration,
  });

  int _preActivate = -1;

  @override
  Widget build(BuildContext context, int index, bool active) {

    var geta = gets[index];

    var pre = _preActivate;
    if (active) {
      _preActivate = index;
    }

    if (active) {
      return TransitionContainer.upper(
        data: index,
        duration: Duration(milliseconds: duration),
        curve: curve,
        child: geta(true),
      );
    }

    if (pre == index) {
      return TransitionContainer.upper(
        reverse: true,
        curve: curve,
        duration: Duration(milliseconds: duration),
        child: geta(false),
      );
    }

    return geta(false);
  }
}

