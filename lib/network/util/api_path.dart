enum APIPath { login }

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.login:
        return "logins";
      default:
        return "";
    }
  }
}
