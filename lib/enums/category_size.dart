enum CategorySize { Small, Medium, Large }

int getSizeIndex(CategorySize categorySize) {
  switch (categorySize) {
    case CategorySize.Small:
      return 0;
    case CategorySize.Medium:
      return 1;
    case CategorySize.Large:
      return 2;
    default:
      return 0;
  }
}

CategorySize getSizeByIndex(int index) {
  switch (index) {
    case 0:
      return CategorySize.Small;
    case 1:
      return CategorySize.Medium;
    case 2:
      return CategorySize.Large;
    default:
      throw Exception("CategorySizeIndexError");
  }
}
