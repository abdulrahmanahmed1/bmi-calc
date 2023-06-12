import 'package:flutter/material.dart';

class result extends StatelessWidget {
  const result(
      {Key? key, required this.Result, required this.isMale, required this.age})
      : super(key: key);

  final Result;
  final isMale;
  final age;

  String get ResultText{
    String rt = '';
    if(Result>=30){
      rt = 'Obese';
    }
    else if(Result >= 25 && Result < 30){
      rt = 'OverWeight';
    }
    else if(Result >= 18.5 && Result < 25){
      rt = 'Normal';
    }
    else{
      rt = 'UnderWeight';
    }
    return rt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  'Gender : ${isMale ? 'male' : 'female'}',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
              ),
              Text(
                  'Result : ${Result.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
              ),
              Text(
                  'Healthiness : $ResultText',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
              ),
              Text(
                  'Age : $age',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
