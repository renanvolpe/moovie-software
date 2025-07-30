import 'package:flutter/material.dart';

import 'model/menu_item_model.dart';

class AppBarController extends ChangeNotifier {
  AppBarController() {
    menuItemSelected = getMenuItems().first;
  }
  late MenuItemModel menuItemSelected;

  selectMenu(MenuItemModel value) {
    menuItemSelected = value;
    notifyListeners();
  }

  List<MenuItemModel> getMenuItems() {
    return [
      MenuItemModel(label: 'Home', onTap: () {}, isSelected: true),
      MenuItemModel(label: 'Pricing', onTap: () {}),
      MenuItemModel(label: 'Movies', onTap: () {}),
      MenuItemModel(label: 'Series', onTap: () {}),
      MenuItemModel(label: 'Collection', onTap: () {}),
      MenuItemModel(label: 'FAQ', onTap: () {}),
    ];
  }
}
