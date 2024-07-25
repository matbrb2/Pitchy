///Main file
import 'package:Pitchy/modules/AppModule/app_module.dart';
import 'package:Pitchy/modules/TestModule/background_widget.dart';
import 'package:Pitchy/modules/TestModule/frequency_mp3.dart';
import 'package:Pitchy/modules/TestModule/pitch_demo.dart';
import 'package:Pitchy/modules/TestModule/recorder.dart';
import 'package:Pitchy/modules/TestModule/vocal.dart';
import 'package:Pitchy/services/services_module.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/GameModule/game_module.dart';
import 'modules/SettingsModule/settings_module.dart';
import 'modules/StatsModule/stats_module.dart';

///start the app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService().loadTranslation();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GameService>(
        create: (context) => GameService(),
      ),
      ChangeNotifierProvider<SettingsService>(
        create: (context) => SettingsService(),
      ),
    ],
    child: const MyApp(),
  ));
  //runApp(const MyApp());
}

///Widget containing the basement of our flutter app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfect Pitch',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

///Widget containing the main layout of our flutter app
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return CarouselSlider(
        options: CarouselOptions(
            height: media.size.height,
            autoPlay: false,
            initialPage: 1,
            enableInfiniteScroll: false,
            viewportFraction: 1),
        items: [
          const Layout(
            child:  Settings(),
            title: "SETTINGS",
            headerBackgroundColor: Colors.black,
            backgroundColor: Colors.black,
            color: Colors.white,
          ),
          Layout(
            child: const Game(),
            title: "GAME",
            margin: false,
            dynamicHeaderColor: true,
            headerBackgroundColor: Colors.black.withOpacity(0.2),
            backgroundColor: Colors.black,
            color: Colors.white,
          ),
          const Layout(
            child:  Statistics(),
            title: "STATISTICS",
            margin: false,
            headerBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            color: Colors.black,
          ),
          const Layout(
            child:  TrackListScreen(),
            title: "TRACKLIST",
            margin: false,
            headerBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            color: Colors.black,
          ),
          const FrequencyTest(),
          RecordWidget(),
          SpeechTranscriptionScreen(),
          ShazamCircleAnimation(),
          FullScreenColorBackground(),
          const PitchDetectorWidget(
            title: "pitch",
          )
        ]);
  }
}
