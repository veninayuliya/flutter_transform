import 'package:flutter/material.dart';
import 'package:flutter_transform/flip.dart';
// import 'dart:math';

import 'package:flutter_transform/matrix.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const Matrix(),
      home: const Flip(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const Matrix()
            // Transform.rotate(
            //   angle: -45 * (pi / 180.0),
            //   child: ElevatedButton(
            //     child: const Text("Rotated button"),
            //     onPressed: () {},
            //   ),
            // ),
            // Transform(
            //   transform: Matrix4.rotationZ(-45 * (pi / 180.0)),
            //   alignment: Alignment.center,
            //   child: ElevatedButton(
            //     child: const Text("Rotated button"),
            //     onPressed: () {},
            //   ),
            // ),
            // Transform.scale(
            //   scale: 2.0,
            //   child: ElevatedButton(
            //     child: const Text("scaled up"),
            //     onPressed: () {},
            //   ),
            // ),
            // Transform(
            //   transform: Matrix4.identity()..scale(2.0, 2.0),
            //   alignment: Alignment.center,
            //   child: ElevatedButton(
            //     child: const Text("scaled up (matrix)"),
            //     onPressed: () {},
            //   ),
            // ),
            // Transform.translate(
            //   offset: const Offset(100, 300),
            //   child: ElevatedButton(
            //     child: const Text("translated to bottom"),
            //     onPressed: () {},
            //   ),
            // ),
            // Transform(
            //   transform: Matrix4.translationValues(100, 300, 0),
            //   child: ElevatedButton(
            //     child: const Text("translated to bottom (matrix)"),
            //     onPressed: () {},
            //   ),
            // ),
            // Transform.translate(
            //   offset: const Offset(70, 200),
            //   child: Transform.rotate(
            //     angle: -45 * (pi / 180.0),
            //     child: Transform.scale(
            //       scale: 2.0,
            //       child: ElevatedButton(
            //         child: const Text("multiple transformations"),
            //         onPressed: () {},
            //       ),
            //     ),
            //   ),
            // ),
            // Transform(
            //   alignment: Alignment.center,
            //   transform: Matrix4.translationValues(70, 200, 0)
            //     ..rotateZ(-45 * (pi / 180.0))
            //     ..scale(2.0, 2.0),
            //   child: ElevatedButton(
            //     child: const Text("multiple transformations (matrix)"),
            //     onPressed: () {},
            //   ),
            // )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
