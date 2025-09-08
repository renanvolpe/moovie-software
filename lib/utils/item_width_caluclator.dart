 double itemWidthCalculator(double screenWidth, double spacing) {
    int itemsPerRow;
     if (screenWidth < 600) {
      itemsPerRow = 3; // mobile
    } else if (screenWidth < 900) {
      itemsPerRow = 4; // tablet portrait
    } else if (screenWidth < 1200) {
      itemsPerRow = 5; // tablet/desktop
    } else {
      itemsPerRow = 7; // wide desktop
    }

    final itemWidth = (screenWidth - (spacing * (itemsPerRow - 1))) / itemsPerRow;
    return itemWidth;
  }