/// This library contains the app services
/// 
/// It includes settings services, API services.
library services;

import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:Pitchy/models/models_module.dart';
import 'package:Pitchy/models/spotify/spotify_models.dart';


import 'package:audioplayers/audioplayers.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:http/http.dart' as http;

part 'game_service.dart';
part 'settings_service.dart';
part 'translation_service.dart';
part 'spotify_service.dart';