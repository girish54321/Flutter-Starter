enum APIPath { login, users }

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.login:
        return "login";
      case APIPath.users:
        return "/users";
      default:
        return "";
    }
  }
}
