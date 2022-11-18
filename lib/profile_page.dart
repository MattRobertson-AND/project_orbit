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
          ElevatedButton(onPressed: () {}, child: const Text('Tech Principal')),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MySkills()));
              },
              child: const Text('My Skills'))
        ]));
  }
}
