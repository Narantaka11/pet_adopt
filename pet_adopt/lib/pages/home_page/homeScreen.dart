import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configuration.dart';
import '../../models/models.dart';
import 'home_page_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    final petCategory = Provider.of<AnimalCategoryBottomModel>(context).number;
    final petsLength = Provider.of<AnimalSelectedModel>(context).petsLength;
    final size = MediaQuery.of(context).size;

    return AnimatedContainer(
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 400),
      transform: Matrix4.translationValues(_xOffset, _yOffset, 0)
        ..scale(_scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40.0 : 0),
      ),
      child: Stack(
        children: <Widget>[
          // Background container
          Container(
            margin: EdgeInsets.only(top: size.height * 0.12),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(isDrawerOpen ? 40.0 : 0),
                topRight: Radius.circular(kPadding * 1.5),
                topLeft: Radius.circular(kPadding * 1.5),
              ),
            ),
          ),

          // Pet carousel
          Positioned(
            top: size.height * 0.17,
            bottom: 0,
            child: AnimalList(
              size: size,
              isDrawerOpen: isDrawerOpen,
              petsLength: petsLength,
            ),
          ),

          // Top bar with menu, location, and profile
          Positioned(
            top: 15,
            child: Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Menu or back icon
                  IconButton(
                    icon: Icon(
                      isDrawerOpen ? Icons.arrow_back_ios : Icons.menu,
                      size: isDrawerOpen ? 30 : 35,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isDrawerOpen) {
                          _xOffset = 0;
                          _yOffset = 0;
                          _scaleFactor = 1;
                          isDrawerOpen = false;
                        } else {
                          _xOffset = 230;
                          _yOffset = 150;
                          _scaleFactor = 0.6;
                          isDrawerOpen = true;
                        }
                      });
                    },
                  ),

                  // Location info
                  Column(
                    children: <Widget>[
                      const Text(
                        'Lokasi',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(Icons.location_on, color: Colors.green),
                          Text(
                            'Depok, ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Indonesia',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Profile picture
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage('lib/assets/images/person.jpg'),
                  ),
                ],
              ),
            ),
          ),

          // Search box
          Positioned(
            top: size.height * 0.13,
            child: const SearchBoxText(),
          ),

          // Category icons
          Positioned(
            top: size.height * 0.25,
            child: Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height * 0.135,
              child: PerCategoryIconsButtons(
                size: size,
                petCategory: petCategory,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
