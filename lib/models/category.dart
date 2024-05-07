class Category {
  final String title;
  final String image;

  Category({required this.title, required this.image});
}

final List<Category> categories = [
  Category(title: "Ovo", image: 'lib/assets/ovo.png'),
  Category(title: "Dana", image: 'lib/assets/dana.png'),
  Category(title: "GoPay", image: 'lib/assets/gopay.png'),
  Category(title: "ShopeePay", image: 'lib/assets/shopeepay.png'),
  Category(title: "Telkomsel", image: 'lib/assets/telkomsel.png'),
  Category(title: "Tri", image: 'lib/assets/tri.png'),
  Category(title: "Indosat", image: 'lib/assets/indosat.png'),
  Category(title: "More", image: 'lib/assets/more.png')
];
