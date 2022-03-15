class OnBoardModel {
  String title;
  String description;
  String image;
  OnBoardModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoardModel> models = [
  OnBoardModel(
      title: 'Soru', description: 'Text', image: 'assets/images/1.png'),
  OnBoardModel(
      title: 'Konu', description: 'Desc', image: 'assets/images/2.png'),
  OnBoardModel(
      title: 'Çözüm', description: 'Desc', image: 'assets/images/1.png')
];
