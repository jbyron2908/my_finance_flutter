enum FlavorType { dev, production }

FlavorType currentFlavor = FlavorType.dev;

class FlavorValues {
  FlavorValues({
    required this.baseUrlRest,
    required this.baseUrlGraphQL,
    required this.githubToken,
  });

  final String baseUrlRest;
  final String baseUrlGraphQL;
  final String githubToken;
}
