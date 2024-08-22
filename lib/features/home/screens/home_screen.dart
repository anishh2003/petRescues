import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_rescues/core/constants/constants.dart';
import 'package:pet_rescues/features/auth/controller/auth_controller.dart';
import 'package:pet_rescues/features/home/drawers/profile_drawer.dart';
import 'package:pet_rescues/settings/theme_provider.dart';
import 'package:routemaster/routemaster.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 0;

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigateToFiltersScreen(BuildContext context) {
    Routemaster.of(context).push('/filters');
  }

  @override
  void initState() {
    var darkTheme = ref.read(darkThemeProvider);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => Padding(
          padding: EdgeInsets.only(
            bottom: 20,
          ),
          child: new AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            title: Text(
                "Please enter your postcode below so we can show you pets near you",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface)),
            content: const SizedBox(
              width: 250,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PostCode',
                ),
              ),
            ),
            actions: <Widget>[
              FilledButton(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Search around my area",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.surface),
                  ),
                )),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;
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
              navigateToFiltersScreen(context);
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: SingleChildScrollView(child: Constants.tabWidgets[_page]),
      drawer: const ProfileDrawer(),
      bottomNavigationBar: CupertinoTabBar(
        height: 60,
        activeColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_carousel),
            label: 'Pets',
            activeIcon: TabButtonSelectedStyle(icon: Icons.view_carousel),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favourites',
            activeIcon: TabButtonSelectedStyle(icon: Icons.favorite_outline),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Notifications',
            activeIcon: TabButtonSelectedStyle(icon: Icons.chat_bubble),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Account',
            activeIcon: TabButtonSelectedStyle(icon: Icons.favorite_outline),
          ),
        ],
        onTap: onPageChanged,
        currentIndex: _page,
      ),
    );
  }
}

class TabButtonSelectedStyle extends StatelessWidget {
  const TabButtonSelectedStyle({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon),
    );
  }
}
