import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

/// @nodoc
class SpeechTranscriptionScreen extends StatefulWidget {
  @override
  _SpeechTranscriptionScreenState createState() =>
      _SpeechTranscriptionScreenState();
}
/// @nodoc
class _SpeechTranscriptionScreenState extends State<SpeechTranscriptionScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  final String _selectedLocaleId = 'fr';
  String _text = 'Press the button and start speaking';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          localeId: _selectedLocaleId,
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
        );
      } else {
        print("The user has denied the use of speech recognition.");
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(child: Text(_text)),
            TextButton(
              onPressed: _listen,
              child: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
          ],
        ),
      ),
    );
  }
}
