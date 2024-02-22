import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyDialog extends StatefulWidget {
  final String? msg;

  const MyDialog({this.msg});

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  late AudioCache audioCache;
  late AudioPlayer audioPlayer;
  final String audioPath = 'audios/ado.wav';

  @override
  void initState() {
    super.initState();
    audioCache = AudioCache();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play audio twice when the dialog is opened
    Future.delayed(Duration.zero, () {
      playAudio();
      Future.delayed(const Duration(milliseconds: 300), () {
        playAudio();
      });
    });

    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Attention'),
            const SizedBox(height: 20),
            Text('${widget.msg}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to play the audio
  Future<void> playAudio() async {
    final result = await audioCache.load(audioPath);
    audioPlayer.play(DeviceFileSource(result.path))
        .catchError((onError){
      print('');
    });
  }
}
