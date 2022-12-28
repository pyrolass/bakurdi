import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

Future<void> startListening(SpeechToText speech) async {
  var status = await Permission.microphone.request();

  if (status.isGranted) {
    await speech.initialize();
  }
}

Future<void> stopListening(SpeechToText speech) async {
  await speech.stop();
}
