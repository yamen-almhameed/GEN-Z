import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_99/Getx/EventController.dart';
import 'package:flutter_application_99/Repetitions/appbar.dart';
import 'package:flutter_application_99/Repetitions/grawer__list.dart';
import 'package:flutter_application_99/Repetitions/theme_service.dart';
import 'package:flutter_application_99/reg_event_user.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
  final EventController eventController = Get.put(EventController());

  // Key for controlling the Scaffold's drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey, // Add the key here to control the scaffold's state
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            width: screenWidth,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(71, 136, 124, 176),
                  Color.fromARGB(48, 194, 130, 27),
                  Color.fromARGB(55, 251, 134, 0),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(23),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.04),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState
                              ?.openDrawer(); // Open the drawer when button is pressed
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.04),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(Icons.notifications,
                            color: Color(0xff575a60)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  width: screenWidth * 0.83,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Color(0xffb2b0ab)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0xff696969)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Special Section
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "#SpecialForYou",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Arial",
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          // List of Events
          SizedBox(
            width: screenWidth * 0.9,
            height: screenHeight * 0.2,
            child: Obx(() {
              if (eventController.events.isEmpty) {
                return const Center(
                  child: Text('No events at this time.'),
                );
              }
              return ListView.builder(
                itemCount: eventController.events.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final event = eventController.events[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        var eventid = eventController.events
                            .elementAt(index)
                            .eventid
                            .toString();
                        print(eventid);
                        Get.to(const EventDetails(), arguments: eventid);
                      },
                      child: Container(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          // image: DecorationImage(
                          //  // image: NetworkImage(event.imageUrl),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              color: Colors.grey,
                              child: Text(
                                event.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          // Upcoming Events Section
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "#Upcoming Events",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Arial",
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'GEN-Z',
                  style: TextStyle(
                      color: Color(0xFF42454b),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial'),
                ),
                const SizedBox(
                  width: 190,
                ),
                GestureDetector(
                  onTap: () {
                    print('Share button pressed');
                  },
                  child: const Image(
                    image: AssetImage('assets/images/Image/share.png'),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: Image.asset('assets/images/Image/Icon (3).png'),
                  title: const Text('Profile',
                      style: TextStyle(color: Color(0xFF1B1F26), fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Image.asset('assets/images/Image/Icon (4).png'),
                  title: const Text('Home',
                      style: TextStyle(color: Color(0xFF1B1F26), fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Image.asset('assets/images/Image/Date_fill@3x.png'),
                  title: const Text('Events',
                      style: TextStyle(color: Color(0xFF1B1F26), fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Image.asset('assets/images/Image/server-02 (1).png'),
                  title: const Text('Organization',
                      style: TextStyle(color: Color(0xFF1B1F26), fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Image.asset('assets/images/Image/globe-01.png'),
                  title: const Text('DarkMode',
                      style: TextStyle(color: Color(0xFF1B1F26), fontSize: 16)),
                  onTap: () {
                    ThemeService().changeTheme();
                  },
                ),
                ListTile(
                  leading: Image.asset('assets/images/Image/Filter.png'),
                  title: const Text('Filter events',
                      style: TextStyle(color: Color(0xFF1B1F26), fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                const Divider(thickness: 1, color: Colors.grey),
                ListTile(
                  leading: Image.asset('assets/images/Image/Icon (1).png'),
                  title: const Text('Settings',
                      style: TextStyle(color: Color(0xFF1B1F26), fontSize: 16)),
                  onTap: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  leading: Image.asset('assets/images/Image/Icon (2).png'),
                  title: const Text('Logout',
                      style: TextStyle(color: Color(0xFF1B1F26), fontSize: 16)),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/CreateUser',
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
