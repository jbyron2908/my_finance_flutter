enum FlavorType { DEV, PRODUCTION }

FlavorType currentFlavor = FlavorType.DEV;

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
