import 'dart:core';

enum RoutePath {
  home('/home'),
  diary('/diary'),
  playlist('/playlist');

  final String path;

  const RoutePath(this.path);
}
