class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method
    return AUTH_LOGIN;
  }

  static const AUTH_LOGIN = '/auth-login';
  static const HOME = '/home';
  static const SCAN_PRODUK = '/scan-produk';
  static const SCAN_SCANNER = '/scan-scanner';
  static const SOCKET_TEST = '/socket-test';
  static const SOCKET_TEST_SENDER = '/socket-test-sender';
}
