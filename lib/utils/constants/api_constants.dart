class ApiConstants {
  static const baseUrl = 'http://10.0.2.2:3000/api/v1/';
  static const imageUrl = 'http://10.0.2.2:3000/';

  String imagePath(String url){
    return imageUrl + url;
  }

}