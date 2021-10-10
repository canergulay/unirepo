class AssetPaths {
  static AssetPaths _instace = AssetPaths._init();
  static AssetPaths get instance => _instace;
  AssetPaths._init();

  final String home = "assets/icons/home.png";
  final String user = "assets/icons/user.png";
  final String search = "assets/icons/search.png";
  final String university = "assets/icons/university.png";
  final String login = "assets/icons/login.png";

  final String GOOD = "assets/icons/good.png";
  final String BAD = "assets/icons/bad.png";
  final String INFO = "assets/icons/info.png";
}
