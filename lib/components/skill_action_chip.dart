import 'package:flutter/material.dart';

import '../skill.dart';

class SkillActionChip extends StatelessWidget {
  Skill skill;
  Function() onPressed;

  SkillActionChip({super.key, required this.onPressed, required this.skill});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            skill.skillName,
          ),
          const SizedBox(
            width: 4,
          ),
          Container(
              padding: const EdgeInsets.all(4),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.primaries.first),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(skill.level.index.toString()),
              ))
        ],
      ),
    );
  }
}
