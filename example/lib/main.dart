/*
 *  Copyright 2020 chaobinwu89@gmail.com
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import 'package:convex_app_bar_example/convex_button_demo.dart';
import 'package:convex_app_bar_example/custom_appbar_sample.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'default_appbar_demo.dart';
import 'Ext.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (_) => HeyConvexAppBar(),
        "/bar": (BuildContext context) => DefaultAppBarDemo(),
        "/custom": (BuildContext context) => CustomAppBarDemo(),
        "/fab": (BuildContext context) => ConvexButtonDemo(),
      },
    );
  }
}

class HeyConvexAppBar extends StatefulWidget {
  const HeyConvexAppBar({Key key}) : super(key: key);

  @override
  _HeyConvexAppBarState createState() => _HeyConvexAppBarState();
}

class _HeyConvexAppBarState extends State<HeyConvexAppBar> {
  double _durationOfBar = 300;
  double _durationOfItem = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello ConvexAppBar')),
      body: Column(
        children: [
          Center(
              child: TextButton(
            child: Text('Click to show full example'),
            onPressed: () => Navigator.of(context).pushNamed('/bar'),
          )),
          Row(
            children: [
              Text("Duration of Bar, 300~1000"),
              Slider(
                value: _durationOfBar,
                min: 100,
                max: 1000,
                divisions: 18,
                label: _durationOfBar.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _durationOfBar = value;
                  });
                },
              )
            ],
          ),
          Row(
            children: [
              Text("Duration of Item, 100~700"),
              Slider(
                value: _durationOfItem,
                min: 100,
                max: 1000,
                divisions: 18,
                label: _durationOfItem.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _durationOfItem = value;
                  });
                },
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar.suoyi(
        gets: [
          createTabItem('Sounds', 'icon_sounds'),
          (bool active) {
            return UITestSuit.createBorderWrapper(
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 132,
                    width: 132,
                    child: Stack(alignment: AlignmentDirectional.center, children: [
                      Image.asset(
                        "images/tab/icon_o@2x.png",
                        height: 132,
                        width: 132,
                      ),
                      Image.asset(
                        "images/tab/icon_wave@2x.png",
                        height: 56,
                        width: 56,
                      ),
                    ]),
                  ),
                ],
              )
            );
          },
          createTabItem('Setting', 'icon_setting')
        ],
        initialActiveIndex: 1,
        durationOfItem: 300,
        durationOfBar: 700,
        curveOfBar: Cubic(0.41, 0.01, 0, 1.18),
        curveOfItem: Curves.easeInOut,
        onTap: (index) {},
        height: 168,
        curveSize: 226,
        top: -60,
        backgroundColor: Colors.white54,
      ),
    );
  }
}

/// name: icon_xxx which has active version like icon_xxx_active
createTabItem(String name, String path) {
  return (bool active) {
    // return UITestSuit.createBorderWrapper(SizedBox(
    //   width: 56,
    //   height: 84,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       //LibImage.img('tab/$path${active ? '' : '_active'}@2x.png', 56, 56),
    //       Image.asset("images/tab/$path${active ? '' : '_active'}@2x.png", height: 56, width: 56,),
    //       Text(name,
    //         style: TextStyle(
    //             fontSize: 20,
    //             fontWeight: FontWeight.normal,
    //             color: Colors.blue
    //         ),)
    //     ],
    //   ),
    // ));

    return UITestSuit.createBorderWrapper(Container(
      // width: 56,
      // height: 84,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //LibImage.img('tab/$path${active ? '' : '_active'}@2x.png', 56, 56),
          Image.asset(
            "images/tab/$path${active ? '' : '_active'}@2x.png",
            height: 56,
            width: 56,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.blue),
          )
        ],
      ),
    ));
  };
}
