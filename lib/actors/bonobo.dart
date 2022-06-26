

import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:layout/game_main.dart';

enum BonoboState {
  walking,
}

class Bonobo extends SpriteAnimationGroupComponent with HasGameRef<GameMain> {
  static Vector2 gravity = Vector2(0, 600);
  Vector2 velocity = Vector2.zero();
  double ground = 0.0;

  static final _animationMap = {
    BonoboState.walking: SpriteAnimationData.sequenced(amount: 4, stepTime: 0.1, textureSize: Vector2(180,180))
  };

  Bonobo(Image image) : super.fromFrameData(image, _animationMap);


  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    anchor = Anchor.center;
    size = Vector2(128, 128);
    position = Vector2(64, gameRef.size.y /2);
  }

  @override
  void onMount()  {
    super.onMount();
    ground = gameRef.size.y - 64;
    position.y = ground -100;


  }

  @override
  void update(double dt) {
    position += velocity * dt - gravity * dt * dt / 2;
    velocity += gravity * dt;

    current = BonoboState.walking;

    if(position.y >= ground) {

      if(velocity.y > 300) {
        print(velocity.y);
      }
      velocity = Vector2(0, 0);
      position.y = ground;

    }
    super.update(dt);
  }

  void jumpForward() {
    if(position.y >= ground) {
      position.y = ground;
      velocity += Vector2(200, -400);
    }


  }

  void jumpBackward() {
    if(position.y >= ground) {
      position.y = ground;
      velocity += Vector2(-200, -400);
    }


  }

  void walkForward() {
    velocity += Vector2(600, 0);
  }

  void walkBackward() {
    velocity += Vector2(-600, 0);
  }




}