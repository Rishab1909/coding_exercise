import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  var attempts = 0;
  int score = 0;
  var duration = 5;
  // ignore: prefer_typing_uninitialized_variables
  var currentSecond;
  // ignore: prefer_typing_uninitialized_variables
  var randomNumber;

  void incrementCounter() {
    setState(() {
      score++;
    });
  }

  int randomNumberGenerator() {
    randomNumber = Random().nextInt(60);
    return randomNumber;
  }

  final CountDownController _countDownController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'Check Your Luck!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Current Second: $currentSecond",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 100,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Random Number: $randomNumber",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (currentSecond != randomNumber)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Sorry Try Again!",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Attempts : $attempts",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (currentSecond == randomNumber)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Success :)",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Score : $score / $attempts",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 50,
            ),
            CircularCountDownTimer(
              controller: _countDownController,
              duration: duration,
              strokeWidth: 10,
              width: MediaQuery.of(context).size.width / 2,
              height: 100,
              ringColor: Colors.blue.shade700,
              fillColor: Colors.grey,
              isReverse: true,
              isReverseAnimation: false,
              onComplete: () {
                attempts++;
                _countDownController.restart();
                //setState(() {});
              },
              autoStart: true,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                attempts++;
                currentSecond = DateTime.now().second;
                Timer.periodic(const Duration(seconds: 1), (Timer timer) {
                  currentSecond = DateTime.now().second;
                });
                randomNumberGenerator();
                _countDownController.restart();
                if (currentSecond == randomNumber) score++;
                setState(() {});
              },
              child: const Text(
                "Click",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
