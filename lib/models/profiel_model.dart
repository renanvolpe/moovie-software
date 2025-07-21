// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  String name;
  String imageAsset;
  String username;

  ProfileModel({
    required this.name,
    required this.imageAsset,
    required this.username,
  });

  factory ProfileModel.empty() {
    return ProfileModel(name: '', imageAsset: '', username: '');
  }
}
