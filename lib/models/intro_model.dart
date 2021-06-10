class IntroModel {
  String? title;
  String? subtitile;
  String? image;

  IntroModel({this.title, this.subtitile, this.image});
}

IntroModel one = IntroModel(
    image: "assets/images/wonder.png",
    title: 'Get inspired',
    subtitile: 'Have a sneak peek of what lenders see');
IntroModel two = IntroModel(
    image: "assets/images/quick.png",
    title: 'Easy and fast',
    subtitile: 'Get summarized and accurate reports fast');
IntroModel three = IntroModel(
    image: "assets/images/growth.png",
    title: 'Plan your future',
    subtitile: 'Plan your spending');

List<IntroModel> intros = [one, two, three];
