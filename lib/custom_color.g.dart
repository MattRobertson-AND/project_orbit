import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const CustomColor2 = Color(0xFF954BF2);

CustomColors lightCustomColors = const CustomColors(
  CustomColor2: Color(0xFF7D2DD9),
  onCustomColor2: Color(0xFFFFFFFF),
  CustomColor2Container: Color(0xFFEDDCFF),
  onCustomColor2Container: Color(0xFF290055),
);

CustomColors darkCustomColors = const CustomColors(
  CustomColor2: Color(0xFFD8B9FF),
  onCustomColor2: Color(0xFF450086),
  CustomColor2Container: Color(0xFF6300BB),
  onCustomColor2Container: Color(0xFFEDDCFF),
);

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.CustomColor2,
    required this.onCustomColor2,
    required this.CustomColor2Container,
    required this.onCustomColor2Container,
  });

  final Color? CustomColor2;
  final Color? onCustomColor2;
  final Color? CustomColor2Container;
  final Color? onCustomColor2Container;

  @override
  CustomColors copyWith({
    Color? CustomColor2,
    Color? onCustomColor2,
    Color? CustomColor2Container,
    Color? onCustomColor2Container,
  }) {
    return CustomColors(
      CustomColor2: CustomColor2 ?? this.CustomColor2,
      onCustomColor2: onCustomColor2 ?? this.onCustomColor2,
      CustomColor2Container:
          CustomColor2Container ?? this.CustomColor2Container,
      onCustomColor2Container:
          onCustomColor2Container ?? this.onCustomColor2Container,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      CustomColor2: Color.lerp(CustomColor2, other.CustomColor2, t),
      onCustomColor2: Color.lerp(onCustomColor2, other.onCustomColor2, t),
      CustomColor2Container:
          Color.lerp(CustomColor2Container, other.CustomColor2Container, t),
      onCustomColor2Container:
          Color.lerp(onCustomColor2Container, other.onCustomColor2Container, t),
    );
  }

  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      CustomColor2: CustomColor2!.harmonizeWith(dynamic.primary),
      onCustomColor2: onCustomColor2!.harmonizeWith(dynamic.primary),
      CustomColor2Container:
          CustomColor2Container!.harmonizeWith(dynamic.primary),
      onCustomColor2Container:
          onCustomColor2Container!.harmonizeWith(dynamic.primary),
    );
  }
}
