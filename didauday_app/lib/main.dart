import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'src/app.dart';
import 'src/core/services/graphql/config/config.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() => runApp(
  GraphQLProvider(
    client: graphQLConfiguration.client,
    child: CacheProvider(child: App()),
  ),
);