import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_theme/json_theme.dart';

final lightThemeProvider = FutureProvider<ThemeData>((ref) async {
  final lightThemeStr =
      await rootBundle.loadString("assets/red_light_theme.json");
  final lightThemeJson = jsonDecode(lightThemeStr);
  final lightTheme =
      ThemeDecoder.decodeThemeData(lightThemeJson) ?? ThemeData();
  return lightTheme;
});

final darkThemeProvider = FutureProvider<ThemeData>((ref) async {
  final darkThemeStr =
      await rootBundle.loadString("assets/red_dark_theme.json");
  final darkThemeJson = jsonDecode(darkThemeStr);
  final darkTheme = ThemeDecoder.decodeThemeData(darkThemeJson) ?? ThemeData();
  return darkTheme;
});

final themeProvider = FutureProvider<Pair<ThemeData, ThemeData>>((ref) async {
  var light = ref.watch(lightThemeProvider.future);
  var dark = ref.watch(darkThemeProvider.future);
  return Pair(await light, await dark);
});

class Pair<T1, T2> {
  final T1 first;
  final T2 second;
  Pair(this.first, this.second);
}
