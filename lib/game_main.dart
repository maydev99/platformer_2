import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:layout/actors/bonobo.dart';

class GameMain extends FlameGame with TapDetector{
  double screenSizeX = 0.0;
  double screenSizeY = 0.0;

  late Bonobo bonobo;

  @override
  Future<void>? onLoad()  async {
    await super.onLoad();
    await images.load('bonobo.png');
    bonobo = Bonobo(images.fromCache('bonobo.png'));
    add(bonobo);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onTapDown(TapDownInfo info) {
    double tapPositionX = info.eventPosition.viewport.x;
    double tapPositionY = info.eventPosition.viewport.y;
    double centerOfScreenX = size.x / 2;
    double centerOfScreenY = size.y / 2;
    print('position: $tapPositionX - $centerOfScreenX');
    if(tapPositionX > centerOfScreenX && tapPositionY < centerOfScreenY) {
      bonobo.jumpForward();
    }
    if(tapPositionX > centerOfScreenX && tapPositionY > centerOfScreenY) {
      bonobo.walkForward();
    }

    if(tapPositionX < centerOfScreenX && tapPositionY < centerOfScreenY) {
      bonobo.jumpBackward();
    }

    if(tapPositionX < centerOfScreenX && tapPositionY> centerOfScreenY) {
      bonobo.walkBackward();
    }
    super.onTapDown(info);
  }

}