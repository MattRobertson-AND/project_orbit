import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import '../skill.dart';

class SkillsService {
  Future<Set<Skill>> getSkills() async {
    try {
      var skills = await rootBundle.loadString("assets/skills/skill_list.json");
      dynamic jsonResponse = jsonDecode(skills);
      Set<Skill> list = (jsonResponse as List)
          .map((skillEntry) => Skill.fromJson(skillEntry))
          .toSet();
      return list;
    } on SocketException {
      throw Exception();
    }
  }
}
