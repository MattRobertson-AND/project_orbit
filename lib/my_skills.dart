import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_orbit/components/profile_image.dart';
import 'package:project_orbit/components/skill_action_chip.dart';
import 'package:project_orbit/skill.dart';
import 'package:project_orbit/view_models/skills_view_model.dart';

import 'add_skill.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddSkill()));
            },
            child: const Icon(Icons.add)),
        appBar: AppBar(
            title: const Hero(tag: "name", child: Text("Matthew Robertson")),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter))],
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [const TopBar(), SkillBlock()],
          ),
        ));
  }
}

class SkillBlock extends ConsumerWidget {
  SkillBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Set<Skill> skills = ref.watch(skillsViewModelProvider);
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
          spacing: 4,
          runSpacing: 4,
          children: skills.isEmpty
              ? [
                  const Center(
                      child:
                          Text("It looks like you have no skills, add some!"))
                ]
              : skills
                  .map((e) => SkillActionChip(onPressed: () {}, skill: e))
                  .toList()),
    ));
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ProfilePicture(
            image: "images/018.jpg",
            height: 100,
            width: 100,
          ),
        )
      ],
    );
  }
}
