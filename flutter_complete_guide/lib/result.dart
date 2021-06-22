import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 12) {
      resultText = 'You are Awesome and Innocent!';
    } else if (resultScore <= 16) {
      resultText = 'You are Likaeble!';
    } else if (resultScore <= 20) {
      resultText = 'You are .. Strange?!';
    } else {
      resultText = 'You are Bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz!'),
            textColor: Colors.indigo,
          )
        ],
      ),
    );
  }
}
