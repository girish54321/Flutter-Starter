enum APIPath { login, articles, feed, user }

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.login:
        return "users/login";
      case APIPath.articles:
        return "/articles";
      case APIPath.feed:
        return "articles/feed";
      case APIPath.user:
        return "profiles/";
      default:
        return "";
    }
  }
}
