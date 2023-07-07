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
  bool _isListPageSelected = false;

  void setPageSelected(bool selected) {
    setState(() {
      _isListPageSelected = selected;
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
              mainAxisSize: MainAxisSize.min,
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
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 38,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                GestureDetector(
                                  onTap: () => setPageSelected(true),
                                  child: HorizontalListViewButton(
                                      title: "Medicações",
                                      isSelected: _isListPageSelected),
                                ),
                                const SizedBox(width: 12),
                                GestureDetector(
                                  onTap: () => setPageSelected(false),
                                  child: HorizontalListViewButton(
                                      title: "Direitos do idoso",
                                      isSelected: !_isListPageSelected),
                                ),
                                const SizedBox(width: 12),
                                HorizontalListViewButton(title: "Compromissos"),
                                const SizedBox(width: 12),
                                HorizontalListViewButton(title: "Diário"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          _isListPageSelected
                              ? const MedicationList()
                              : const RightsDescription()
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

class MedicationList extends StatelessWidget {
  const MedicationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Suas medicações',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 24),
        Container(
          height: 320,
          padding: const EdgeInsets.only(bottom: 8),
          child: ListView(
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
              MedicationItem(
                title: "Alendronato de Sódio",
                description: "1 comprimido 1x semana",
                horario1: "Sex - 07hr",
              ),
              const SizedBox(height: 18),
              MedicationItem(
                title: "Dipirona",
                description: "1 comprimido 1x dia",
                horario1: "09hr",
              ),
              const SizedBox(height: 18),
              MedicationItem(
                title: "Omoprazol",
                description: "1 comprimido 1x dia",
                horario1: "10hr",
              ),
            ],
          ),
        ),
      ],
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Horário: $horario1",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        if (horario2.isNotEmpty)
                          Text(
                            "Horário: $horario2",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
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

class RightsDescription extends StatelessWidget {
  const RightsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Seus direitos',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 24),
        Container(
          height: 320,
          padding: const EdgeInsets.only(bottom: 10),
          child: ListView(
            clipBehavior: Clip.antiAlias,
            shrinkWrap: true,
            children: const [
              Text(
                """§1o Agarantia de prioridade compreende: (Redaçãodada pela Lei no 13.466, de 2017)
              
I – atendimento preferencial imediato e individualizado junto aos órgãos públicos e privados prestadores de serviços à população;

II – preferência na formulação e na execução de políticas sociais públicas específicas;

III – destinação privilegiada de recursos públicos nas áreas relacionadas com a proteção à pessoa idosa; (Redação dada pela Lei no 14.423, de 2022)

IV – viabilização de formas alternativas de participação, ocupação e convívio da pessoa idosa com as demais gerações; (RedaçãodadapelaLeino14.423,de2022)

V – priorização do atendimento da pessoa idosa por sua própria família, em detrimento do atendimento asilar, exceto dos que não a possuam ou careçam de condições de manutenção da própria sobrevivência; (Redação dada pela Lei no 14.423, de 2022)

VI – capacitação e reciclagem dos recursos humanos nas áreas de geriatria e gerontologia e na prestação de serviços às pessoas idosas; (Redação dada pela Lei no 14.423, de 2022)

VII – estabelecimento de mecanismos que favoreçam a divulgação de informações de caráter educativo sobre os aspectos biopsicossociais de envelhecimento;

VIII – garantia de acesso à rede de serviços de saúde e de assistência social locais.

IX – prioridade no recebimento da restituição do Imposto de Renda. (Incluído pela Lei no 11.765, de 2008).""",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HorizontalListViewButton extends StatefulWidget {
  final String title;
  bool isSelected = false;

  HorizontalListViewButton(
      {super.key, required this.title, this.isSelected = false});

  @override
  State<HorizontalListViewButton> createState() =>
      _HorizontalListViewButtonState();
}

class _HorizontalListViewButtonState extends State<HorizontalListViewButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isSelected ? Colors.orangeAccent : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: Border.all(width: 2, color: Colors.black),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: Text(
        widget.title,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }
}
