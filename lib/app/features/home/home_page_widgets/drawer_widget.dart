import 'package:flutter/material.dart';
import 'package:journal/themes/color_schemes.dart';
import 'package:journal/themes/screen_sizes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: screenWidth * 3 / 4,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        children: [
          DrawerHeader(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              splashFactory: InkRipple.splashFactory,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: screenWidth / 12,
                    child: Icon(
                      Icons.person,
                      size: screenWidth / 12,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Username',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Text('My account'),
                    ],
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
          ElevatedButton.icon(
            style: const ButtonStyle(alignment: Alignment.centerLeft),
            icon: Icon(
              Icons.settings_outlined,
              color: currentColorScheme.onPrimary,
            ),
            label: Text(
              'Settings',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onPressed: () {},
          ),
          ElevatedButton.icon(
            style: const ButtonStyle(alignment: Alignment.centerLeft),
            icon: Icon(
              Icons.info_outline,
              color: currentColorScheme.onPrimary,
            ),
            label: Text(
              'About',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onPressed: () {},
          ),
          ElevatedButton.icon(
            style: const ButtonStyle(alignment: Alignment.centerLeft),
            icon: Icon(
              Icons.logout,
              color: currentColorScheme.onPrimary,
            ),
            label: Text(
              'Logout',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
