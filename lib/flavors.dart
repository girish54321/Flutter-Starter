enum Flavor {
  REQRES,
  REQRES_DEV,
  REQRES_QA,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.REQRES:
        return 'https://api.realworld.io/api/';
      case Flavor.REQRES_DEV:
        return 'https://api.realworld.io/api/';
      case Flavor.REQRES_QA:
        return 'https://api.realworld.io/api/';
      default:
        return 'https://api.realworld.io/api/';
    }
  }

  static String get title {
    switch (appFlavor) {
      case Flavor.REQRES:
        return 'ReqRes';
      case Flavor.REQRES_DEV:
        return 'ReqRes DEV';
      case Flavor.REQRES_QA:
        return 'ReqRes QA';
      default:
        return 'title';
    }
  }
}
