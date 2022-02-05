enum APIPath { fetch_album, home_api, play_list }

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.fetch_album:
        return "/albums/1";
      case APIPath.home_api:
        return "mixed-selections";
      case APIPath.play_list:
        return "playlists/";
      default:
        return "";
    }
  }
}
