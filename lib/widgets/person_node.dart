import 'package:flutter/material.dart';

import '../models/person.dart';
import '../themes/app_theme.dart';

class PersonNode extends StatelessWidget {
  final Person person;
  final VoidCallback onTap;

  const PersonNode({super.key, required this.person, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        child: SizedBox(
          width: 84,
          child: Column(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor:
                    person.isYou ? AppColors.forest : AppColors.parchmentDeep,
                child: Text(
                  person.initials,
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: person.isYou ? AppColors.gold : AppColors.forest,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                person.isYou ? 'You' : person.firstName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (!person.isYou && person.relationship != null)
                Text(
                  person.relationship!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10.5, color: AppColors.inkFaint),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
