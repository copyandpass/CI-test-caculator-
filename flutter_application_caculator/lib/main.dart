import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '간단한 계산기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0"; // 현재 화면에 표시되는 값
  String _outputHistory = ""; // 계산 기록
  double _num1 = 0; // 첫 번째 숫자
  double _num2 = 0; // 두 번째 숫자
  String _operand = ""; // 연산자

  void _buttonPressed(String buttonText) {
    // C 버튼을 눌렀을 때 모든 상태를 초기화
    if (buttonText == "C") {
      _output = "0";
      _outputHistory = "";
      _num1 = 0;
      _num2 = 0;
      _operand = "";
    } 
    // 연산자 버튼을 눌렀을 때
    else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _outputHistory = "$_output $_operand";
      _output = "0";
    } 
    // '=' 버튼을 눌렀을 때
    else if (buttonText == "=") {
      _num2 = double.parse(_output);
      if (_operand == "+") {
        _output = (_num1 + _num2).toString();
      }
      if (_operand == "-") {
        _output = (_num1 - _num2).toString();
      }
      if (_operand == "×") {
        _output = (_num1 * _num2).toString();
      }
      if (_operand == "÷") {
        _output = (_num1 / _num2).toString();
      }
      _num1 = 0;
      _num2 = 0;
      _operand = "";
      _outputHistory = "";
    } 
    // 숫자 버튼을 눌렀을 때
    else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    setState(() {}); // UI를 다시 그려 상태 변화를 반영
  }

  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(24.0),
          backgroundColor: color,
        ),
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("간단한 계산기"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              _outputHistory,
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              _output,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("7", Colors.grey[850]!),
                  _buildButton("8", Colors.grey[850]!),
                  _buildButton("9", Colors.grey[850]!),
                  _buildButton("÷", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4", Colors.grey[850]!),
                  _buildButton("5", Colors.grey[850]!),
                  _buildButton("6", Colors.grey[850]!),
                  _buildButton("×", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1", Colors.grey[850]!),
                  _buildButton("2", Colors.grey[850]!),
                  _buildButton("3", Colors.grey[850]!),
                  _buildButton("-", Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("C", Colors.red),
                  _buildButton("0", Colors.grey[850]!),
                  _buildButton("=", Colors.orange),
                  _buildButton("+", Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}