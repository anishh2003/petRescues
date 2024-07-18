import 'package:pet_rescues/features/accounts/accounts_screen.dart';
import 'package:pet_rescues/features/favourites/favourites_screen.dart';
import 'package:pet_rescues/features/home/screens/home_screen.dart';
import 'package:pet_rescues/features/notifications/notifications_screen.dart';
import 'package:pet_rescues/features/pets/pets_screen.dart';

class Constants {
  static const logoPath = 'assets/images/logo.jpg';
  static const googlePath = 'assets/images/google.png';

  static const avatarDefault =
      'https://external-preview.redd.it/5kh5OreeLd85QsqYO1Xz_4XSLYwZntfjqou-8fyBFoE.png?auto=webp&s=dbdabd04c399ce9c761ff899f5d38656d1de87c2';

  static const tabWidgets = [
    PetsScreen(),
    FavouritesScreen(),
    NotificationsScreen(),
    AccountsScreen(),
  ];
}
