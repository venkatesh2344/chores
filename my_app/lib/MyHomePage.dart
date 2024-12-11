import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/auth.dart';
import 'package:my_app/gymcontroller.dart';
import 'package:my_app/homecontroller.dart';
import 'package:my_app/mygymteam.dart';
import 'package:my_app/teamwork.dart';

class MyHomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final AuthController authController = Get.find();
  final Gymcontroller gymController = Get.put(Gymcontroller());

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Chores',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white, // Highlight color for active tab
            tabs: [
              Tab(icon: Icon(Icons.task), text: "Tasks"),
              // Tab(icon: Icon(Icons.people), text: "Team"),
              Tab(icon: Icon(Icons.fitness_center), text: "Gym"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Tasks
            _buildTasksContent(),

            // Tab 2: Team
            // _buildTeamContent(),

            // Tab 3: Gym
            _buildGymContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildTasksContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Welcome ${authController.name}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  homeController.submitData(Get.context!, "1");
                  homeController.getindex();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.all(20.0), // Padding around the icon
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ), // Add a gradient for a beautiful effect
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(2, 4), // Shadow position
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(16.0), // Rounded corners
                      ),
                      child: const Icon(
                        Icons.work, // Replace with your desired icon
                        size: 40.0, // Adjust the icon size
                        color: Colors.white, // Icon color
                      ),
                    ),
                    const SizedBox(height: 8.0), // Space between icon and text
                    const Text(
                      'My Work', // Name below the icon
                      style: TextStyle(
                        fontSize: 16.0, // Font size
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.black87, // Text color
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(Get.to(MyTeam()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(
                            20.0), // Padding around the icon
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.blueAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ), // Add a gradient for a beautiful effect
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.6), // Shadow color
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(2, 4), // Shadow position
                            ),
                          ],
                          borderRadius:
                              BorderRadius.circular(16.0), // Rounded corners
                        ),
                        child: const Icon(
                          Icons.task,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Team Work', // Name below the icon
                        style: TextStyle(
                          fontSize: 16.0, // Font size
                          fontWeight: FontWeight.bold, // Bold text
                          color: Colors.black87, // Text color
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildTeamContent() {
  //   return Center(
  //     child: GestureDetector(
  //       onTap: () {
  //         Get.to(MyTeam());
  //       },
  //       child: Container(
  //         padding: const EdgeInsets.all(16.0),
  //         decoration: BoxDecoration(
  //           color: Colors.blueAccent,
  //           borderRadius: BorderRadius.circular(12.0),
  //         ),
  //         child: const Icon(
  //           Icons.people,
  //           size: 32.0,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildGymContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Welcome ${authController.name}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  gymController.submitData(Get.context!, "0");
                  gymController.getindex();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.all(20.0), // Padding around the icon
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ), // Add a gradient for a beautiful effect
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(2, 4), // Shadow position
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(16.0), // Rounded corners
                      ),
                      child: const Icon(
                        Icons.work, // Replace with your desired icon
                        size: 40.0, // Adjust the icon size
                        color: Colors.white, // Icon color
                      ),
                    ),
                    const SizedBox(height: 8.0), // Space between icon and text
                    const Text(
                      'My Gym Work', // Name below the icon
                      style: TextStyle(
                        fontSize: 16.0, // Font size
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.black87, // Text color
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(Get.to(MyGymTeam()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(
                            20.0), // Padding around the icon
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.blueAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ), // Add a gradient for a beautiful effect
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.6), // Shadow color
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(2, 4), // Shadow position
                            ),
                          ],
                          borderRadius:
                              BorderRadius.circular(16.0), // Rounded corners
                        ),
                        child: const Icon(
                          Icons.task,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Team Gym Work', // Name below the icon
                        style: TextStyle(
                          fontSize: 16.0, // Font size
                          fontWeight: FontWeight.bold, // Bold text
                          color: Colors.black87, // Text color
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
