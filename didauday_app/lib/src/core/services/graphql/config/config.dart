import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

import '../../shared_preferences_service.dart';

class GraphQLConfiguration {

  static HttpLink httpLink = HttpLink(
    uri: "http://api.didauday.me/graphql",
  );

  static AuthLink authLink =
  AuthLink(getToken: () async {
    await sharedPreferenceService.getSharedPreferencesInstance();
    final token = await sharedPreferenceService.token;
    return "Bearer $token";
  });

  static Link link =
  authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: link,
    );
  }
}