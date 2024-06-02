class ApiEndPoints {
  static final String baseUrl = "http://192.168.18.38/LARAVEL/pencatatan2/public/api/"; //lokal
  // static final String baseUrl = "https://hello-ivy.id/AGUNG-MOU/public/api/";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String loginApi = 'login/loginApi';
  final String findData = 'produk/findData';
}
