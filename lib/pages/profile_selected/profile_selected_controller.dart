// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../models/profiel_model.dart';

class ProfileSelectedController extends ChangeNotifier {
  ProfileSelectedController(
     this.profileModel,
  );
  ProfileModel profileModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
