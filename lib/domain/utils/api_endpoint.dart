class ApiEndPoints {
  // static final String baseUrl = "http://192.168.1.2/LARAVEL/pencatatan2/public/api/"; //lokal
  static final String baseUrl = "https://deltasuburprima.digitalind.fun/api/";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String loginApi = 'login/loginApi';
  final String findData = 'produk/findData';
}
