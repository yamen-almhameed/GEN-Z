import 'package:flutter/material.dart';
// import 'package:gen_z/main.dart';
// import 'package:gen_z/screens/filter_events_screen.dart';
// import 'package:gen_z/screens/organization_screen.dart';
// import 'package:gen_z/screens/profile_screen.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IconTheme(
          data: Theme.of(context).iconTheme.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                size: 30,
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.event),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.build_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_2_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class CustomBottomAppBar extends StatefulWidget {
//   const CustomBottomAppBar({super.key});

//   @override
//   State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
// }

// class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     const MyApp(),
//     const FilterEventsScreen(),
//     const OrganizationScreen(),
//     const ProfileScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dataset_rounded),
//             label: 'Events',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.data_array_outlined),
//             label: 'Build',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_2_outlined),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
