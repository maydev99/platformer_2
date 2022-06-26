import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:layout/game_main.dart';
import 'package:wakelock/wakelock.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  Wakelock.enable();
  GameMain gameMain = GameMain();
  runApp(GameWidget(game: gameMain));
}

