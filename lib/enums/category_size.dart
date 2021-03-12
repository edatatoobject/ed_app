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
