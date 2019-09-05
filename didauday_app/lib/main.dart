import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'src/app.dart';
import 'src/core/services/graphql/config/config.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() async {
  await DotEnv().load('.env');
  runApp(
      GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(child: App()),
    ),
  );
}