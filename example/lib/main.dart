// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:fx/fx.dart';

void main() => runApp(FxApp());

class FxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FxPage(),
    );
  }
}

class FxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: FxDemos()));
  }
}

class FxDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [WavyDemo()],
    );
  }
}

class WavyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wavy(
      duration: Duration(milliseconds: 750),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera),
          SizedBox(width: 20.0),
          Text('WavyText!!!'),
        ],
      ),
    );
  }
}
