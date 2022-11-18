import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../skill.dart';

final addSkillsViewModelProvider =
    StateNotifierProvider.autoDispose<AddSkillViewModel, Skill?>(
        (ref) => AddSkillViewModel());

class AddSkillViewModel extends StateNotifier<Skill?> {
  AddSkillViewModel() : super(null);

  setSkill(Skill skill) {
    state = skill;
  }

  setSkillName(String name) {
    state = Skill(skillName: name, level: state?.level ?? SkillLevel.unskilled);
  }

  setSkillLevel(SkillLevel level) {
    state = Skill(skillName: state?.skillName ?? "", level: level);
  }

  incrementSkillLevel() {
    if (state?.level.index != SkillLevel.values.length - 1) {
      state = Skill(
          skillName: state?.skillName ?? "",
          level: SkillLevel.values[(state?.level.index ?? 0) + 1]);
    }
  }

  decrementSkillLevel() {
    if (state?.level.index != 0) {
      state = Skill(
          skillName: state?.skillName ?? "",
          level: SkillLevel.values[(state?.level.index ?? 1) - 1]);
    }
  }
}
