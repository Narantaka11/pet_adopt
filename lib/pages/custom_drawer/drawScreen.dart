import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../configuration.dart';
import '../../models/models.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    int indexDrawer = Provider.of<DrawerOptionModel>(context).number;

    void _logout(BuildContext context) {
      Navigator.pushReplacementNamed(context, '/');
    }

    void _goToProfile(BuildContext context) {
      Navigator.pushNamed(context, '/profile');
    }

    return Container(
      color: primaryGreen,
      padding: const EdgeInsets.only(top: 50, bottom: 30, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('lib/assets/images/person.jpg'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Angeline Caroline',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Active Status',
                    style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: drawerItems.map((element) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<DrawerOptionModel>(context, listen: false).number = element['id'];
                  },
                  child: Row(
                    children: [
                      Icon(
                        element['icon'],
                        color: indexDrawer == element['id'] ? Colors.white : Colors.white38,
                        size: 28,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        element['title'],
                        style: TextStyle(
                          color: indexDrawer == element['id'] ? Colors.white : Colors.white38,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => _goToProfile(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.person, color: Colors.white, size: 24),
                      SizedBox(width: 12),
                      Text("Profile", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _logout(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.logout, color: Colors.white, size: 24),
                      SizedBox(width: 12),
                      Text("Log out", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
