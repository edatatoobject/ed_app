enum CategorySize { Small, Medium, Large }

int getSizeIndex(CategorySize categorySize) {
  if (categorySize == CategorySize.Small) {
    return 0;
  }
  if (categorySize == CategorySize.Medium) {
    return 1;
  }
  if (categorySize == CategorySize.Large) {
    return 2;
  }

  return 0;
}
