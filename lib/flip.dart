import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flip_panel/flip_panel.dart';

class Flip extends StatelessWidget {
  const Flip({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlipPanel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'flip_image': (_) => const AnimatedImagePage(),
        'flip_clock': (_) => const FlipClockPage(),
        'countdown_clock': (_) => const CountdownClockPage(),
        'reverse_countdown': (_) => ReverseCountdown(),
      },
      home: const MyFlip(),
    );
  }
}

class MyFlip extends StatelessWidget {
  const MyFlip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlipPanel'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('FlipImage'),
            onTap: () => Navigator.of(context).pushNamed('flip_image'),
          ),
          ListTile(
            title: const Text('FlipClock'),
            onTap: () => Navigator.of(context).pushNamed('flip_clock'),
          ),
          ListTile(
            title: const Text('CountdownClock'),
            onTap: () => Navigator.of(context).pushNamed('countdown_clock'),
          ),
          ListTile(
            title: const Text('DaysToGo'),
            onTap: () => Navigator.of(context).pushNamed('reverse_countdown'),
          ),
        ],
      ),
    );
  }
}

class AnimatedImagePage extends StatelessWidget {
  const AnimatedImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    const imageWidth = 320.0;
    const imageHeight = 171.0;
    const toleranceFactor = 0.033;
    const widthFactor = 0.125;
    const heightFactor = 0.5;

    final random = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlipImage'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  0,
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                ]
                    .map((count) => FlipPanel.stream(
                          itemStream: Stream.fromFuture(Future.delayed(
                              Duration(milliseconds: random.nextInt(20) * 100),
                              () => 1)),
                          itemBuilder: (_, value) => value <= 0
                              ? Container(
                                  color: Colors.white,
                                  width: widthFactor * imageWidth,
                                  height: heightFactor * imageHeight,
                                )
                              : ClipRect(
                                  child: Align(
                                      alignment: Alignment(
                                          -1.0 +
                                              count * 2 * 0.125 +
                                              count * toleranceFactor,
                                          -1.0),
                                      widthFactor: widthFactor,
                                      heightFactor: heightFactor,
                                      child: Image.asset(
                                        'assets/images/flutter-cover.png',
                                        width: imageWidth,
                                        height: imageHeight,
                                      ))),
                          initValue: 0,
                          spacing: 0.0,
                          direction: FlipDirection.up,
                        ))
                    .toList(),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  0,
                  1,
                  2,
                  3,
                  4,
                  5,
                  6,
                  7,
                ]
                    .map((count) => FlipPanel.stream(
                          itemStream: Stream.fromFuture(Future.delayed(
                              Duration(milliseconds: random.nextInt(20) * 100),
                              () => 1)),
                          itemBuilder: (_, value) => value <= 0
                              ? Container(
                                  color: Colors.white,
                                  width: widthFactor * imageWidth,
                                  height: heightFactor * imageHeight,
                                )
                              : ClipRect(
                                  child: Align(
                                      alignment: Alignment(
                                          -1.0 +
                                              count * 2 * 0.125 +
                                              count * toleranceFactor,
                                          1.0),
                                      widthFactor: widthFactor,
                                      heightFactor: heightFactor,
                                      child: Image.asset(
                                        'assets/images/flutter-cover.png',
                                        width: imageWidth,
                                        height: imageHeight,
                                      ))),
                          initValue: 0,
                          spacing: 0.0,
                          direction: FlipDirection.down,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FlipClockPage extends StatelessWidget {
  const FlipClockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlipClock'),
      ),
      body: Center(
        child: SizedBox(
          height: 64.0,
          child: FlipClock.simple(
            startTime: DateTime.now(),
            digitColor: Colors.white,
            backgroundColor: Colors.black,
            digitSize: 48.0,
            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
          ),
        ),
      ),
    );
  }
}

class CountdownClockPage extends StatelessWidget {
  const CountdownClockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlipClock'),
      ),
      body: Center(
        child: SizedBox(
          height: 64.0,
          child: FlipClock.countdown(
            duration: const Duration(minutes: 1),
            digitColor: Colors.white,
            backgroundColor: Colors.black,
            digitSize: 48.0,
            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
            onDone: () => print('ih'),
          ),
        ),
      ),
    );
  }
}

class ReverseCountdown extends StatelessWidget {
  final bool debugMode = true;
  DateTime now = DateTime.now();
  DateTime dDay = DateTime(2018, 11, 26, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    dDay = (debugMode)
        ? DateTime(now.year, now.month + 2, now.day, now.hour, now.minute,
            now.second + 10)
        : dDay;

    Duration _duration = dDay.difference(now);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ReverseCountdown'),
      ),
      body: Center(
        child: SizedBox(
          height: 64.0,
          child: FlipClock.reverseCountdown(
            duration: _duration,
            digitColor: Colors.white,
            backgroundColor: Colors.black,
            digitSize: 30.0,
            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
            //onDone: () => print('ih'),
          ),
        ),
      ),
    );
  }
}
