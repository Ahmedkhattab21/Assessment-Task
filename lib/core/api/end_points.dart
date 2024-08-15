class EndPoints {
  static const baseUrl = "https://fixed.wiqaya.co";



  ///
  /// api image
  static const imageBaseUrl = "/storage/";

  /// image
  static String? getImageFromApi(String imageUrl) =>
      baseUrl + imageBaseUrl + imageUrl;

  static String? getImageFromShared(String? imageUrl) =>
      imageUrl?.replaceRange(0, baseUrl.length, "");
}
