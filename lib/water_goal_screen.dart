import 'dart:math';
import 'dart:async';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:math';
import 'dart:async';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'BaseCard.dart';
import 'constants.dart';


class WaterGoalScreen extends StatefulWidget {
  const WaterGoalScreen({Key? key}) : super(key: key);

  @override
  State<WaterGoalScreen> createState() => _WaterGoalScreenState();
}

class _WaterGoalScreenState extends State<WaterGoalScreen> {
  final TextEditingController waterController = TextEditingController();
  // Instance variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Water Goal',
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
                      'How many liters of water do you want to drink?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kBrightTextColor,
                      ),
                    ),
                    TextFormField(
                      controller: waterController,
                      decoration: new InputDecoration(labelText: "Enter amount of Liters"),
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
