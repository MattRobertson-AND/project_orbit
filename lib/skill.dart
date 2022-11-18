class Skill {
  String skillName;
  SkillLevel level;
  Skill({required this.skillName, required this.level});

  static fromJson(Map<String, dynamic> skillEntry) {
    return Skill(
        skillName: skillEntry['skillName'] as String,
        level: skillEntry['level'] as SkillLevel);
  }
}

enum SkillLevel { unskilled, beginner, intermediate, advanced, expert }
