import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:mp3_info/mp3_info.dart';

/// @nodoc
class FrequencyTest extends StatefulWidget {
  const FrequencyTest({Key? key}) : super(key: key);

  @override
  State<FrequencyTest> createState() => _FrequencyTestState();
}

/// @nodoc
class _FrequencyTestState extends State<FrequencyTest> {
  void play() async {
    ByteData bytes = await rootBundle.load('assets/audio/frequency/660.mp3');
    final mp3 = MP3Processor.fromBytes(bytes.buffer.asUint8List());

    print('assets/audio/frequency/660.mp3');

    switch (mp3.sampleRate) {
      case SampleRate.rate_32000:
        print('Sample rate: 32KHz');
        break;
      case SampleRate.rate_44100:
        print('Sample rate: 44.1KHz');
        break;
      case SampleRate.rate_48000:
        print('Sample rate: 48KHz');
        break;
      default:
        print('Unknown sample rate. Should not happen');
        break;
    }

    print('Bit rate: ${mp3.bitrate}bps');
    print('Duration: ${mp3.duration}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text("Frequency rate detector"),
        onPressed: () => play(),
      ),
    );
  }
}
