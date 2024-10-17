class ApiConstants {
  static const baseUrl = 'http://195.201.2.105:3000/api/v1/';
  static const imageUrl = 'http://195.201.2.105:3000/';
  // static const baseUrl = 'http://10.0.2.2:3000/api/v1/';
  // static const imageUrl = 'http://10.0.2.2:3000/';

  static String getImagePath(String url) {
    return imageUrl + url.replaceAll('\\', '/');
  }
}
