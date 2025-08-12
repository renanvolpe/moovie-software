class CategoriesModel {
  String name;
  bool isValid;

  CategoriesModel({
    required this.isValid,
    required this.name,
  });
}

final List<CategoriesModel> mockCategories = [
  CategoriesModel(name: "Action", isValid: true),
  CategoriesModel(name: "Adventure", isValid: true),
  CategoriesModel(name: "Animation", isValid: true),
  CategoriesModel(name: "Biography", isValid: false),
  CategoriesModel(name: "Comedy", isValid: true),
  CategoriesModel(name: "Crime", isValid: true),
  CategoriesModel(name: "Documentary", isValid: false),
  CategoriesModel(name: "Drama", isValid: true),
  CategoriesModel(name: "Family", isValid: true),
  CategoriesModel(name: "Fantasy", isValid: true),
  CategoriesModel(name: "History", isValid: false),
  CategoriesModel(name: "Horror", isValid: true),
  CategoriesModel(name: "Music", isValid: true),
  CategoriesModel(name: "Musical", isValid: false),
  CategoriesModel(name: "Mystery", isValid: true),
  CategoriesModel(name: "Romance", isValid: true),
  CategoriesModel(name: "Sci-Fi", isValid: true),
  CategoriesModel(name: "Sport", isValid: false),
  CategoriesModel(name: "Thriller", isValid: true),
  CategoriesModel(name: "War", isValid: true),
];
