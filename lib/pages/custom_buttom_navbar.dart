import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/favorites_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/profile_page.dart';
import 'package:food_delivery_app/utils/app_color.dart';
class CustomButtomNavbar extends StatefulWidget {
  const CustomButtomNavbar({super.key});

  @override
  State<CustomButtomNavbar> createState() => _CustomButtomNavbarState();
}

class _CustomButtomNavbarState extends State<CustomButtomNavbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(
        child: Center(
           child: Text('inside the drawer haneen daoud  '),

        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))
        ],
        title:  Column(

          children: [
           Text('Current Location',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppColor.grey
            ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center ,
              children: [
               const Icon(Icons.location_city,color: AppColor.orange   ,),
                Text(
                  'Qalqiliya , palestine',
                  style: Theme.of(context).textTheme.titleLarge,
                  ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: size.width>=800?
      null
      :NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Faavorite',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: const <Widget>[
        HomePage(),
        FavoritesPage(),
        ProfilePage(),
      ][currentPageIndex],
    );
  }
}
