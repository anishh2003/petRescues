import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/features/auth/controller/auth_controller.dart';
import 'package:pet_rescues/features/home/drawers/profile_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 0;

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    // final isGuest = !user.isAuthenticated;
    // final currentTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Pet Rescues',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: false,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => displayDrawer(context),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              //Routemaster.of(context).push('/add-post');
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      // body: Constants.tabWidgets[_page],
      drawer: const ProfileDrawer(),

      // bottomNavigationBar: isGuest || kIsWeb
      //     ? null
      //     : CupertinoTabBar(
      //         activeColor: currentTheme.iconTheme.color,
      //         backgroundColor: currentTheme.backgroundColor,
      //         items: const [
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.home),
      //             label: '',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.add),
      //             label: '',
      //           ),
      //         ],
      //         onTap: onPageChanged,
      //         currentIndex: _page,
      //       ),
    );
  }
}
