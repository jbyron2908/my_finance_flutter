import 'models.dart';

FlavorType currentFlavorType = FlavorType.dev;

class Flavor {
  static FlavorType type = currentFlavorType;
  static FlavorValues values = _getFlavorValues(currentFlavorType);

  static FlavorValues _getFlavorValues(FlavorType flavorType) {
    FlavorValues flavorValues;
    switch (flavorType) {
      case FlavorType.dev:
        flavorValues = _getFlavorDevValues();
        break;
      case FlavorType.production:
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
