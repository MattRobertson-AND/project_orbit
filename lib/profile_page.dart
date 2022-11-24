import 'package:flutter/material.dart';
import 'package:project_orbit/components/profile_image.dart';
import 'package:project_orbit/my_skills.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: ProfileWidget()),
    Text("More"),
    Text("Edit")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matthew Robertson"),
      ),
      // bottomNavigationBar: const AppBottomNavBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const ProfilePicture(image: "images/018.jpg"),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {}, child: Text("Normal Elevated Button")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                // Foreground color
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {},
              child: Text('Tech Principal',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary))),
          const SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MySkills()));
              },
              child: const Text('My Skills')),
          TextButton(
            child: Text("Text Button"),
            onPressed: () {},
          ),
          OutlinedButton(onPressed: () {}, child: Text("Outlined Button"))
        ]));
  }
}
