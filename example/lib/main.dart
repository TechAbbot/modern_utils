import 'package:flutter/material.dart';
import 'package:modern_utils/modern_utils.dart';
import 'package:modern_utils/widgets/dotted_divider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ModernUtils.instance.initialize(
        context: context); // initialize the util is most important part
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: ${metersToKilometers(8320)}',
            ),
            const SizedBox(height: 10),
            const DottedDivider(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            EvolvedButton(
              onTap: _incrementCounter,
              title: "Increment",
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: EvolvedButton(
                    onTap: _decrementCounter,
                    title: "Decrement",
                    color: Colors.pink[200],
                    textColor: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: EvolvedButton(
                    onTap: _resetCounter,
                    title: "Reset",
                    color: Colors.yellow[900],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
