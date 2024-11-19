import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Random random = Random();
  int currentImageIndex = 0;
  int counter = 1;
  final List<String> images = [
    'assets/images/dice-1.png',
    'assets/images/dice-2.png',
    'assets/images/dice-3.png',
    'assets/images/dice-4.png',
    'assets/images/dice-5.png',
    'assets/images/dice-6.png',
  ];
  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100, // Light yellow background
      appBar: AppBar(
        title: const Text('Dice Roll Application'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.rotate(
              angle: random.nextDouble() * pi,
              child: Image.asset(
                images[currentImageIndex],
                height: 100,
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade100, // Light purple button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
              onPressed: () async {
                await player.setAsset('assets/audios/rolling-dice.mp3');
                player.play();

                Timer.periodic(const Duration(milliseconds: 80), (timer) {
                  counter++;
                  setState(() {
                    currentImageIndex = random.nextInt(6);
                  });

                  if (counter >= 13) {
                    timer.cancel();
                    setState(() {
                      counter = 1;
                    });
                  }
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Roll',
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
