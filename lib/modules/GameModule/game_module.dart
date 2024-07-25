/// This library contains the core modules and functionality for the game.
/// 
/// It includes widgets, utilities, and UI related to the game's
/// mechanics, audio processing, and user interaction.
library game_module;
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:Pitchy/modules/AppModule/app_module.dart';
import 'package:Pitchy/models/models_module.dart';
import 'package:Pitchy/services/services_module.dart';

import 'package:provider/provider.dart';


import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';



part 'game_widget.dart';
part 'piano_widget.dart';
part 'pitch_perfect_detector_widget.dart';
part 'tile_widget.dart';
part 'vocal_pitch_perfect_trainer_widget.dart';


