class Category {
  Category({
    this.title = '',
    this.imagePath = '',
  });

  String title;
  String imagePath;

  static List<Category> all = <Category>[
    Category(
      imagePath: 'assets/images/dairy.png',
      title: 'Dairy',
    ),
    Category(
      imagePath: 'assets/images/cereals.png',
      title: 'Cereals',
    ),
    Category(
      imagePath: 'assets/design_course/beverages.png',
      title: 'Beverages',
    ),
    Category(
      imagePath: 'assets/design_course/readytocook.png',
      title: 'Ready to cook',
    ),
    Category(
      imagePath: 'assets/images/cans.png',
      title: 'Cans',
    ),
    Category(
      imagePath: 'assets/images/chips.png',
      title: 'Chips',
    ),
    Category(
      imagePath: 'assets/design_course/snacks.png',
      title: 'Snacks',
    ),
  ];
}
