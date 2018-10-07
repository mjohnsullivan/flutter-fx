// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/widgets.dart';

import 'package:fx/fx.dart';

void main() {
  testWidgets('Wavy shows its child widget', (tester) async {
    await tester.pumpWidget(Wavy(
        child: Directionality(
      textDirection: TextDirection.ltr,
      child: Text('Wavy Text'),
    )));

    expect(find.text('Wavy Text'), findsOneWidget);
  });
}
