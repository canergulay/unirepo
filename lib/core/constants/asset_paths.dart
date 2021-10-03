class AssetPaths {
  static AssetPaths _instace = AssetPaths._init();
  static AssetPaths get instance => _instace;
  AssetPaths._init();

  final String home = "assets/icons/home.png";
  final String user = "assets/icons/user.png";
  final String search = "assets/icons/search.png";
}
