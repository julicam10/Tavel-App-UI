import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/destination_carousel.dart';
import 'package:travel_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color(0xFFD8ECF1)
              : const Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        right: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: Text(
                'What would you like to find?',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20.0),
            const DestinationCarousel(),
            const SizedBox(height: 20.0),
            const HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.search_rounded,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.circle_outlined,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Color(0xFFE7EBEE),
            ),
          )
        ],
      ),
    );
  }
}
