import 'package:project_orbit/models/skills_service.dart';

import '../skill.dart';

class SkillsRepository {
  final SkillsService _skillsService = SkillsService();

  Future<List<Skill>> fetchSkillsList() async {
    dynamic response = _skillsService.getSkills() as List;
    List<Skill> list =
        response.map((skillEntry) => Skill.fromJson(skillEntry)).toList();
    return list;
  }
}
