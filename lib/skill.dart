import 'package:flutter/foundation.dart';

class Skill {
  String skillName;
  SkillLevel level;
  Skill({required this.skillName, required this.level});

  factory Skill.fromJson(Map<String, dynamic> skillEntry) {
    return Skill(
        skillName: skillEntry['skillName'] as String,
        level: SkillLevel.values
            .firstWhere((e) => describeEnum(e) == skillEntry['level']));
  }
}

enum SkillLevel { unskilled, beginner, intermediate, advanced, expert }
