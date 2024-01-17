import 'package:church/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';

import 'package:community_material_icon/community_material_icon.dart';

import '../model/navigation_item.dart';
import '../screens/hymn_book_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/social_media_tile.dart';

class MainDrawer extends StatelessWidget {
  final ScrollController _scroll = ScrollController();

  MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final topPadding = MediaQuery.of(context).padding.top;
    return Drawer(
      width: 3 / 4 * width,
      backgroundColor: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.background,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      clipBehavior: Clip.hardEdge,
      child: Column(children: [
        Container(
          height: topPadding,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          clipBehavior: Clip.hardEdge,
        ),
        Expanded(
            child: Scrollbar(
          thumbVisibility: false,
          trackVisibility: false,
          interactive: true,
          controller: _scroll,
          thickness: 5,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
                overscroll: false, physics: const ClampingScrollPhysics()),
            child: ListView(
              controller: _scroll,
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Image.asset(
                    'assets/images/church_image_drawer.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const DrawerListTile(
                  titleName: 'Hymnbook',
                  titleIcon: Icons.music_note,
                  routeName: HymnBookScreen.routeName,
                  item: NavigationItem.hymnbook,
                ),
                const DrawerListTile(
                  titleName: 'Favorites',
                  titleIcon: Icons.favorite,
                  routeName: FavoritesScreen.routeName,
                  item: NavigationItem.favorites,
                ),
                ListTile(
                  horizontalTitleGap: 5,
                  tileColor: Colors.transparent,
                  title: Text(
                    'Follow us',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                      top: 5, bottom: 0, left: 25, right: 20),
                ),
                SocialMediaTile(
                  socialMedia: 'YouTube',
                  accountName: '@gachq',
                  socialIcon: CommunityMaterialIcons.youtube,
                  linkText: Uri.parse('https://www.youtube.com/@gachq'),
                ),
                SocialMediaTile(
                  socialMedia: 'Facebook',
                  accountName: 'Gac Headquarters',
                  socialIcon: CommunityMaterialIcons.facebook,
                  linkText: Uri.parse(
                      "https://web.facebook.com/Gac-Headquarters-104257107601052/?ref=page_internal"),
                ),
                SocialMediaTile(
                    socialMedia: 'Instagram',
                    accountName: '@gachqs',
                    socialIcon: CommunityMaterialIcons.instagram,
                    linkText: Uri.parse('https://www.instagram.com/gachqs/')),
                SocialMediaTile(
                    socialMedia: 'Twitter',
                    accountName: '@gachqs',
                    socialIcon: CommunityMaterialIcons.twitter,
                    linkText: Uri.parse('https://twitter.com/gachqs')),
              ],
            ),
          ),
        )),
      ]),
    );
  }
}
