# Modern Utils
Widgets and functions for routine use. Light weight on code.

| **Support** | Android | iOS | Linux | macOS | Web | Windows |
| ----------- | ------- | --- | ----- | ----- | --- | ------- |


### Initialize the Global Utils

`import 'package:modern_utils/modern_utils.dart';`

`GlobalUtils.instance.initialize(context: context);`

Example:

    import 'package:modern_utils/modern_utils.dart';

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
            GlobalUtils.instance.initialize(
                screenSize: MediaQuery.sizeOf(context),
            );  <--------- Add this line
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


Example with `flutter_screenutil`:


    import 'package:modern_utils/modern_utils.dart';

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
            return ScreenUtilInit(
            builder: (context, child) {
                // initialize ModernUtils inside builder
                ModernUtils.instance.initialize(
                    screenSize: MediaQuery.sizeOf(context),
                    screenUtil: ScreenUtil(), <--------- Add this line for responsiveness
                    evolvedButtonStyle: EvolvedButtonStyle(
                        fontSize: largeScreen ? 20 : 16,
                    ),
                );  <--------- Add this line

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

### Widgets

Simple and Stylist button with customizable components

    EvolvedButton()

Pre-define TextFormField with default style

    ModernTextField()

Dotted horizontal divider

    DottedDivider()


### Functions

To check if has internet. It uses default `io` library

    hasNetwork()

To split the list in multiple list. i.e. [1, 2, 3, 4, 5, 6] split this list in 3 section then result will be [[1, 2], [2, 3], [5, 6]]
    
    splitList()

To convert Simple String to List. i.e. "[1,2,3,4]" to [1, 2, 3, 4]

    convertStringToListString()

To convert seconds to time format. i.e 8320 to 2h 18m 40s

    secondsToTime()

To convert meters to kilometers. i.e. 8320 to 8.32 km

    metersToKilometers()


## Contribution

Feel Free to request any missing features or report issues [here](https://github.com/priyesh-techabbot/modern_utils).
