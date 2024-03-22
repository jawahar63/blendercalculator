import 'package:blendercalculator/textlab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'input.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<String> fpsItems = ['12', '15', '24', '25', '30', '60', '120'];
  var renderTime = "HH:MM";

  var lenOfVideo = "MM:SS";

  final minPerFrame = TextEditingController();

  final secPerFrame = TextEditingController();

  final totalFrame = TextEditingController();

  // final fPS = TextEditingController();
  String fPS = '';
  @override
  void initState() {
    fPS = fpsItems[2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wid = MediaQuery.of(context).size.width;
    final hei = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(9, 20, 31, 1),
        appBar: AppBar(
          title: Text(
            "Blendercalculator",
            style: GoogleFonts.inika(),
          ),
          backgroundColor: const Color.fromRGBO(232, 125, 13, 1),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: wid < 480 ? wid / 1.05 : 480,
                height: hei / 1.15,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(60, 80, 98, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fill the detail for the first frame :',
                      style: GoogleFonts.inika(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const textlab(Textmes: 'Minutes:'),
                        SizedBox(width: wid < 340 ? 2 : wid / 50),
                        input(
                          hintText: 'MM',
                          controller: minPerFrame,
                        ),
                        SizedBox(width: wid < 340 ? 2 : wid / 50),
                        const textlab(Textmes: 'Seconds:'),
                        SizedBox(width: wid < 340 ? 2 : wid / 50),
                        input(
                          hintText: 'SS',
                          controller: secPerFrame,
                        ),
                      ],
                    ),
                    SizedBox(height: hei / 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const textlab(Textmes: 'Total Frame:'),
                        SizedBox(width: wid < 340 ? 2 : wid / 50),
                        input(
                          hintText: '250',
                          controller: totalFrame,
                        ),
                        SizedBox(width: wid < 340 ? 2 : wid / 50),
                        const textlab(Textmes: 'fPS:'),
                        SizedBox(width: wid < 340 ? 2 : wid / 50),
                        // input(
                        //   hintText: '24',
                        //   controller: fPS,
                        // ),
                        Container(
                          width: wid < 400
                              ? wid < 320
                                  ? 40
                                  : wid / 6
                              : 55,
                          height: hei / 19,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: DropdownButton(
                                value: fPS,
                                items: fpsItems
                                    .map<DropdownMenuItem<String>>(
                                      (v) => DropdownMenuItem(
                                        value: v,
                                        child: Text(v),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (String? value) => setState(
                                  () {
                                    if (value != null) fPS = value;
                                  },
                                ),
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                                underline: Container(),
                                iconSize: wid < 350 ? 0 : 16,
                                // decoration: const InputDecoration(
                                //   border: InputBorder.none,
                                // ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: hei / 40),
                    GestureDetector(
                      onTap: () {
                        int min = int.parse(minPerFrame.text);
                        int sec = int.parse(secPerFrame.text);
                        int tf = int.parse(totalFrame.text);
                        int fps = int.parse(fPS);
                        sec = sec + (min * 60);
                        int ans = sec * tf;
                        int thrs = (ans / 3600).floor();
                        int tmin = ((ans / 60).floor()) % 60;
                        int lenvideo = (tf / fps).floor();
                        setState(() {
                          renderTime = "$thrs:$tmin hrs";
                          lenOfVideo = "00:$lenvideo min";
                        });
                        Feedback.forTap(context);
                      },
                      child: Container(
                        width: wid < 400 ? wid - 200 : 200,
                        height: hei / 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 3.0,
                                  offset: Offset(0, 2)),
                            ]),
                        child: Center(
                            child: Text(
                          'Calculate',
                          style: GoogleFonts.inika(
                              color: const Color.fromRGBO(9, 20, 31, 1)),
                        )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text(
                        'Total Time To Render (appox):',
                        style: GoogleFonts.inriaSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      renderTime,
                      style: GoogleFonts.inika(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 247, 0),
                          fontSize: 18,
                          letterSpacing: 1),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                      child: Text(
                        'Length of th video:',
                        style: GoogleFonts.inriaSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      lenOfVideo,
                      style: GoogleFonts.inika(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 247, 0),
                          fontSize: 18,
                          letterSpacing: 1),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: wid < 420 ? wid - 100 : 400,
                      height: hei < 600 ? hei / 8 : hei / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
