import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_orbit/models/skills_service.dart';

final skillsProvider = Provider<SkillsService>((ref) {
  return SkillsService();
});
