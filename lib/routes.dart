import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inflearn/result/result_scene.dart';

import 'main/main_scene.dart';

final routes = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const MainScene();
    },
  ),

  GoRoute(
    path: '/result',
    builder: (BuildContext context, GoRouterState state) {
      final height = double.parse(state.uri.queryParameters['height']!);
      final weight = double.parse(state.uri.queryParameters['weight']!);

      return ResultScene(height: height, weight: weight);
    }
  ),
]);
