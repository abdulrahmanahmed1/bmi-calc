import 'package:flutter/material.dart';
import 'result.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double height = 170;
  int age = 20;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body mass index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'Male'),
                    const SizedBox(
                      width: 15,
                    ),
                    m1Expanded(context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            ' cm',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 210,
                        value: height,
                        onChanged: (val) {
                          setState(() {
                            height=val;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'Weight'),
                    const SizedBox(
                      width: 15,
                    ),
                    m2Expanded(context, 'Age'),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // ignore: non_constant_identifier_names
                  double Result = weight / pow(height / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          result(Result: Result, isMale: isMale, age: age),
                    ),
                  );
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 18,
                  width: double.infinity,
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            type == 'Male' ? isMale = true : isMale = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'Male') || (!isMale && type == 'Female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              type == 'Male'
                  ? const Icon(
                      Icons.male,
                      size: 90,
                    )
                  : const Icon(Icons.female, size: 90),
              const SizedBox(
                height: 15,
              ),
              Text(type, style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(type, style: Theme.of(context).textTheme.headline2),
            Text(type == 'Age' ? '$age' : '$weight',
                style: Theme.of(context).textTheme.headline1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'Age' ? 'age--' : 'weight--',
                  onPressed: () =>
                      setState(() => type == 'Age' ? age-- : weight--),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  heroTag: type == 'Age' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => type == 'Age' ? age++ : weight++),
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
