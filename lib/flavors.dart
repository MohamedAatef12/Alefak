enum Flavor {
  customerdev,
  customerprod,
  traderdev,
  traderprod,
  admindev,
  adminprod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.customerdev:
        return 'Customer Dev';
      case Flavor.customerprod:
        return 'Customer';
      case Flavor.traderdev:
        return 'Trader Dev';
      case Flavor.traderprod:
        return 'Trader';
      case Flavor.admindev:
        return 'Admin Dev';
      case Flavor.adminprod:
        return 'Admin';
    }
  }

}
