import 'models.dart';

FlavorType currentFlavorType = FlavorType.DEV;

class Flavor {
  static FlavorType type = currentFlavorType;
  static FlavorValues values = _getFlavorValues(currentFlavorType);

  static FlavorValues _getFlavorValues(FlavorType flavorType) {
    FlavorValues flavorValues;
    switch (flavorType) {
      case FlavorType.DEV:
        flavorValues = _getFlavorDevValues();
        break;
      case FlavorType.PRODUCTION:
        flavorValues = _getFlavorProdValues();
        break;
      default:
        flavorValues = _getFlavorDevValues();
    }

    return flavorValues;
  }

  static FlavorValues _getFlavorDevValues() {
    return FlavorValues(
      baseUrlRest: 'https://api.github.com',
      baseUrlGraphQL: 'https://api.github.com/graphql',
      githubToken: '',
    );
  }

  static FlavorValues _getFlavorProdValues() {
    return FlavorValues(
      baseUrlRest: 'https://api.github.com',
      baseUrlGraphQL: 'https://api.github.com/graphql',
      githubToken: '',
    );
  }
}
