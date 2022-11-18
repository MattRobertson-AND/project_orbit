import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_orbit/skill.dart';
import 'package:project_orbit/view_models/add_skill_view_model.dart';
import 'package:project_orbit/view_models/skills_view_model.dart';

class AddSkill extends StatelessWidget {
  const AddSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.filter))
            ],
            title: const Text("Add a Skill"),
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back))),
        body: const AddSkillBody());
  }
}

class SkillLevelSlider extends ConsumerStatefulWidget {
  const SkillLevelSlider({super.key});

  @override
  ConsumerState<SkillLevelSlider> createState() => _SkillLevelSliderState();
}

class _SkillLevelSliderState extends ConsumerState<SkillLevelSlider> {
  @override
  void initState() {
    super.initState();
    //ref.read(addSkillsViewModelProvider.notifier).setSkillName("");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final value = ref.watch(addSkillsViewModelProvider);
    final notifier = ref.watch(addSkillsViewModelProvider.notifier);
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(value?.level.name ?? ""),
        Slider(
            label: value?.level.name ?? "",
            divisions: SkillLevel.values.length - 1,
            value: value?.level.index.toDouble() ?? 0,
            min: 0,
            max: SkillLevel.values.length.toDouble() - 1,
            onChanged: (newValue) =>
                notifier.setSkillLevel(SkillLevel.values[newValue.toInt()])),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () => notifier.decrementSkillLevel(),
              icon: const Icon(Icons.chevron_left)),
          IconButton(
              onPressed: () => notifier.incrementSkillLevel(),
              icon: const Icon(Icons.chevron_right))
        ])
      ]),
    ));
  }
}

class SkillChoiceChipCard extends ConsumerStatefulWidget {
  const SkillChoiceChipCard({super.key});

  @override
  ConsumerState<SkillChoiceChipCard> createState() =>
      _SkillChoiceChipCardState();
}

class _SkillChoiceChipCardState extends ConsumerState<SkillChoiceChipCard> {
  @override
  void initState() {
    super.initState();
    final value = ref.read(addSkillsViewModelProvider);
  }

  final List<String> _skillList = [
    "iOS",
    ".NET",
    "Javascript",
    "TypeScript",
    "Figma",
    "Miro",
    "Cat Herding",
    "C",
    "C++",
    "Pascal"
  ];

  Widget _buildChip(String text, int index) {
    final value = ref.watch(addSkillsViewModelProvider);
    final notifier = ref.read(addSkillsViewModelProvider.notifier);

    return ChoiceChip(
        label: Text(
          text,
        ),
        selected: (value?.skillName ?? "") == text,
        onSelected: (_) => notifier.setSkillName(text));
  }

  _chipList() {
    return _skillList
        .asMap()
        .entries
        .map((entry) => _buildChip(entry.value, entry.key))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Wrap(spacing: 4, runSpacing: 4, children: _chipList()),
      ),
    );
  }
}

class AddSkillBody extends ConsumerWidget {
  const AddSkillBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skill = ref.watch(addSkillsViewModelProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text("Select a Skill")),
          const SizedBox(height: 20),
          const SkillChoiceChipCard(),
          const SizedBox(height: 20),
          const Center(child: Text("Select the level you are at")),
          const SizedBox(height: 20),
          const SkillLevelSlider(),
          const SizedBox(height: 20),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    if (skill != null) {
                      ref
                          .read(skillsViewModelProvider.notifier)
                          .addSkill(skill);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Add Skill")))
        ],
      ),
    );
  }
}
