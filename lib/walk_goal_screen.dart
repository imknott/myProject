
import 'dart:math';
import 'dart:async';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'BaseCard.dart';
import 'constants.dart';


class WalkGoalScreen extends StatefulWidget {
  const WalkGoalScreen({Key? key}) : super(key: key);

  @override
  State<WalkGoalScreen> createState() => _WalkGoalScreenState();
}

class _WalkGoalScreenState extends State<WalkGoalScreen> {
  final TextEditingController mileController = TextEditingController();
  // Instance variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Walk goal',
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
                      'Daily walk goal',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kBrightTextColor,
                      ),
                    ),
                    TextFormField(
                      controller: mileController,
                      decoration: new InputDecoration(labelText: "Enter amount of miles"),
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
