import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_utils/modern_utils.dart';
import 'package:modern_utils/widgets/dotted_divider.dart';
import 'package:modern_utils/widgets/modern_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool largeScreen = MediaQuery.sizeOf(context).width > 600;

    return ScreenUtilInit(
      designSize: largeScreen ? const Size(800, 1000) : const Size(360, 690),
      builder: (context, child) {
        ModernUtils.instance.initialize(
          screenSize: MediaQuery.sizeOf(context),
          screenUtil: ScreenUtil(),
          evolvedButtonStyle: EvolvedButtonStyle(
            fontSize: largeScreen ? 20 : 16,
          ),
        ); // initialize the util is most important part

        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              primary: Colors.blueAccent,
              seedColor: Colors.blueAccent,
            ),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Home'),
        );
      },
    );
  }
}

class MyAppSimple extends StatelessWidget {
  const MyAppSimple({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ModernUtils.instance.initialize(
      screenSize: MediaQuery.sizeOf(context),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.blueAccent,
          seedColor: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
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
  TextEditingController hintController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  double _counter = 0;

  @override
  void initState() {
    super.initState();
  }

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
  void dispose() {
    hintController.dispose();
    labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () async {
              bool check = await hasNetwork();
              if (mounted) {
                ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
                    content: Text('${check ? 'Connected to' : 'No'} network')));
              }
            },
            child: const Text("Network"),
          ),
        ],
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
            const SizedBox(height: 20),
            ModernTextField(
              controller: hintController,
              hintText: 'Counter Number in int',
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(height: 20),
            ModernTextField(
              controller: labelController,
              labelText: 'Counter Number',
              hintText: 'Enter counter number in double',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 20),
            EvolvedButton(
              onTap: () {
                if (hintController.text.trim().isNotEmpty) {
                  if (double.tryParse(hintController.text) != null) {
                    _counter = double.parse(hintController.text);
                    hintController.clear();
                    setState(() {});
                    FocusScope.of(context).unfocus();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter valid number')));
                  }
                } else if (labelController.text.trim().isNotEmpty) {
                  if (double.tryParse(labelController.text) != null) {
                    _counter = double.parse(labelController.text);
                    labelController.clear();
                    setState(() {});
                    FocusScope.of(context).unfocus();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter valid number')));
                  }
                }
              },
              title: "Decrement",
              dynamicSize: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
