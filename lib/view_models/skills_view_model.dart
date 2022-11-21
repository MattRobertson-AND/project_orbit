import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_orbit/models/skills_service.dart';

import '../models/skills_service_provider.dart';
import '../skill.dart';

part 'skills_view_model.freezed.dart';

final skillsViewModelProvider =
    StateNotifierProvider<SkillsViewModel, SkillsViewModelState>(
        (ref) => SkillsViewModel(ref.watch(skillsProvider)));

@freezed
class SkillsViewModelState with _$SkillsViewModelState {
  const factory SkillsViewModelState({
    @Default({}) Set<Skill> skills,
    @Default(true) bool isLoading,
  }) = _SkillsViewModelState;

  const SkillsViewModelState._();
}

class SkillsViewModel extends StateNotifier<SkillsViewModelState> {
  final SkillsService skillsService;

  Set<Skill> _skills = {};

  SkillsViewModel(this.skillsService) : super(const SkillsViewModelState()) {
    getSkills();
  }

  Future<Set<Skill>> getSkills() async {
    state = state.copyWith(isLoading: true);
    _skills = await skillsService.getSkills();
    state = state.copyWith(skills: _skills, isLoading: false);
    return state.skills;
  }

  void removeSkill(Skill skill) {
    _skills.removeWhere((element) => element.skillName == skill.skillName);
    state = state.copyWith(skills: _skills);
  }

  void addSkill(Skill skill) {
    _skills.add(skill);
    state = state.copyWith(skills: _skills);
  }

  void updateSkill(Skill skill) {
    _skills.removeWhere((element) => element.skillName == skill.skillName);
    _skills.add(skill);
    state = state.copyWith(skills: _skills);
  }
}
