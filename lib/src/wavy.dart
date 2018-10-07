// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

/// Adds a 'wavy' effect to any widget along the horizontal plane
///
///```dart
/// WavyWidget(
///   child: Text('Wavy Text!'),
/// );
/// ```

class Wavy extends StatefulWidget {
  Wavy({
    this.child,
    this.duration = const Duration(milliseconds: 500),
  });
  final Widget child;
  final Duration duration;

  @override
  createState() => _WavyState();
}

class _WavyState extends State<Wavy> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  var skewValue = 0.0;

  @override
  initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = Tween(begin: -0.5, end: 0.5).animate(curve)
      ..addListener(() => setState(() => skewValue = animation.value))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.skewX(skewValue),
      child: widget.child,
    );
  }

  @override
  dispose() {
    controller?.dispose();
    super.dispose();
  }
}
