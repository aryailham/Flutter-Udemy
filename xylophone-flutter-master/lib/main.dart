import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  // membuat function yang return component UI
  // Expanded buildInstrumentButton() {
  //   return Expanded(
  //     flex: 1,
  //     child: Container(
  //       width: double.maxFinite,
  //       child: TextButton(
  //         style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all(backgroundColor),
  //         ),
  //         onPressed: (){
  //           playAudio(audioName: this.audioName);
  //         },
  //       ),
  //     ),
  //   );
  // }

  // arrow function: arrow yang dipakai jika function hanya berisi 1 baris

  // Expanded buildInstrumentButton() => Expanded(
  //       flex: 1,
  //       child: Container(
  //         width: double.maxFinite,
  //         child: TextButton(
  //           style: ButtonStyle(
  //             backgroundColor: MaterialStateProperty.all(backgroundColor),
  //           ),
  //           onPressed: (){
  //             playAudio(audioName: this.audioName);
  //           },
  //         ),
  //       ),
  //     );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InstrumentButton(audioName: "note1.wav", backgroundColor: Colors.red),
              InstrumentButton(audioName: "note2.wav", backgroundColor: Colors.orange),
              InstrumentButton(audioName: "note3.wav", backgroundColor: Colors.yellow),
              InstrumentButton(audioName: "note4.wav", backgroundColor: Colors.green),
              InstrumentButton(audioName: "note5.wav", backgroundColor: Colors.blue),
              InstrumentButton(audioName: "note6.wav", backgroundColor: Colors.indigo),
              InstrumentButton(audioName: "note7.wav", backgroundColor: Colors.purple),
            ]
          ),
        ),
      ),
    );
  }
}

class InstrumentButton extends StatelessWidget {
  final String audioName;
  final Color backgroundColor;

  InstrumentButton({
    this.audioName,
    this.backgroundColor = Colors.black
  });

  final audioPlayer = AudioCache();

  void playAudio({String audioName}) {
    audioPlayer.play(audioName);
  }

  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.maxFinite,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
          ),
          onPressed: (){
            playAudio(audioName: this.audioName);
          },
        ),
      ),
    );
  }
}
