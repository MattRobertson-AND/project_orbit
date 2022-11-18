import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_orbit/models/skills_service.dart';

import '../models/skills_service_provider.dart';
import '../skill.dart';

final skillsViewModelProvider =
    StateNotifierProvider<SkillsViewModel, Set<Skill>>(
        (ref) => SkillsViewModel(ref.watch(skillsProvider)));

class SkillsViewModel extends StateNotifier<Set<Skill>> {
  SkillsViewModel(SkillsService skillsService) : super({});

  Set<Skill> getSkills() {
    return state;
  }

  void removeSkill(Skill skill) {
    state =
        state.where((element) => element.skillName != skill.skillName).toSet();
  }

  void addSkill(Skill skill) {
    state = {...state, skill};
  }

  void updateSkill(Skill skill) {
    state = {
      ...state.where((element) => element.skillName != skill.skillName).toSet(),
      skill
    };
  }
}
