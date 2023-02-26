import 'dart:math';
import 'dart:async';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'BaseCard.dart';
import 'constants.dart';


class SleepGoalScreen extends StatefulWidget {
  const SleepGoalScreen({Key? key}) : super(key: key);

  @override
  State<SleepGoalScreen> createState() => _SleepGoalScreenState();
}

class _SleepGoalScreenState extends State<SleepGoalScreen> {
  final TextEditingController timeController = TextEditingController();
  // Instance variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Sleep Goal',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: kBrightTextColor,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: BaseCard(
                  theColor: kDarkCardColor,
                  theChild: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Time you want to sleep',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kBrightTextColor,
                        ),
                      ),
                TextFormField(
                  controller: timeController,
                    decoration: new InputDecoration(labelText: "Enter 24 hour time"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly],
                ),
        ],
      ),
    ),
        ),
      ),
    ],
      ),
    );
  }
}
