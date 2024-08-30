enum Flavor {
  coffee,
  pizza,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.coffee:
        return 'Coffee App';
      case Flavor.pizza:
        return 'Pizza App';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.coffee:
        return 'https://coffeeBaseUrl.com';
      case Flavor.pizza:
        return 'https://pizzaBaseUrl.com';
      default:
        return 'http://normalBaseUrl.com';
    }
  }

  static String get imageUrl {
    switch (appFlavor) {
      case Flavor.coffee:
        return 'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
      case Flavor.pizza:
        return 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
      default:
        return 'https://images.pexels.com/photos/1653877/pexels-photo-1653877.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
    }
  }

  static String get datadogClientToken {
    switch (appFlavor) {
      case Flavor.coffee:
        return 'coffeeToken';
      case Flavor.pizza:
        return 'pizzaToken';
      default:
        return 'defaultToken';
    }
  }

  static String get mixpanelKey {
    switch (appFlavor) {
      case Flavor.coffee:
        return 'coffeeKey';
      case Flavor.pizza:
        return 'pizzaKey';
      default:
        return 'defaultKey';
    }
  }
}
