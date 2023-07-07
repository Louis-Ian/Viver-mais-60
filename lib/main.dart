import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.orangeAccent,
          child: Center(
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //
              // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
              // action in the IDE, or press "p" in the console), to see the
              // wireframe for each widget.
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Viver +60",
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 38,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                HorizontalListViewButton(
                                    title: "Medicações", isSelected: true),
                                const SizedBox(width: 12),
                                HorizontalListViewButton(
                                    title: "Direitos do idoso"),
                                const SizedBox(width: 12),
                                HorizontalListViewButton(title: "Compromissos"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Suas medicações',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 24),
                          Scrollable(
                            viewportBuilder: (context, position) => ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              clipBehavior: Clip.antiAlias,
                              children: [
                                MedicationItem(
                                  title: "Losartana",
                                  description: "1 comprimido 2x dia",
                                  horario1: "07hr",
                                  horario2: "19hr",
                                ),
                                const SizedBox(height: 18),
                                MedicationItem(title: "Alendronato de Sódio",
                                  description: "1 comprimido 1x semana",
                                  horario1: "Sex - 07hr",),
                                const SizedBox(height: 18),
                                MedicationItem(title: "Dipirona",
                                  description: "1 comprimido 1x dia",
                                  horario1: "09hr",),
                                const SizedBox(height: 18),
                                MedicationItem(title: "Losartana",
                                  description: "1 comprimido 2x ao dia",
                                  horario1: "10hr",
                                  horario2: "22hr",),
                                const SizedBox(height: 18),
                                MedicationItem(title: "Losartana",
                                  description: "1 comprimido 2x ao dia",
                                  horario1: "07hr",
                                  horario2: "14hr",),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MedicationItem extends StatelessWidget {
  final String title;
  final String description;
  final String horario1;
  String horario2;

  MedicationItem(
      {super.key,
      required this.title,
      required this.description,
      required this.horario1,
      this.horario2 = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: const Image(
            image: AssetImage("lib/assets/image.jpeg"),
            height: 120,
            width: 120,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Horário: $horario1",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        if(horario2.isNotEmpty)
                          Text(
                            "Horário: $horario2",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                      ],
                    ),
                    const SizedBox(width: 12,),
                    const Icon(Icons.alarm_rounded)
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class HorizontalListViewButton extends StatelessWidget {
  final String title;
  bool isSelected = false;

  HorizontalListViewButton(
      {super.key, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.orangeAccent : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: Border.all(width: 2, color: Colors.black),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }
}
