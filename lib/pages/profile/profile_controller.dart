import 'package:flutter/material.dart';
import 'package:movie_software/models/mock/profile_mock.dart';

import '../../models/profiel_model.dart';

class ProfileController extends ChangeNotifier {
  bool _isSelected = false;
  int _indexSelected = 0;

  saveIsSelected(int index) {
    _isSelected = true;
    _indexSelected = index;
    notifyListeners();
  }

  bool get isSelected => _isSelected;
  int get indexSelected => _indexSelected;

  List<ProfileModel> listProfiles = listProfilesMock.sublist(0,4);

  ProfileModel? profileSelected;
  
  set profile(ProfileModel profile){
    profileSelected = profile;
    notifyListeners();    
  }
}
