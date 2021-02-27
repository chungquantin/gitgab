import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String URI = "localhost:5000/";
const String BACKEND_URI = "http://$URI";
const String WEBSOCKET_URI = "wss://$URI";

class GraphQLConfig {
  static final HttpLink _httpLink = HttpLink(BACKEND_URI);
  static String _token = "";
  static final AuthLink _authLink = AuthLink(getToken: () => _token);

  static final WebSocketLink _websocketLink = WebSocketLink(
    WEBSOCKET_URI,
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      // ignore: deprecated_member_use
      initPayload: () async {
        return {
          'headers': {'Authorization': _token},
        };
      },
    ),
  );

  static final Link link = Link.split((request) => request.isSubscription,
      _websocketLink, _authLink.concat(_httpLink));

  static final ValueNotifier<GraphQLClient> client =
      ValueNotifier<GraphQLClient>(GraphQLClient(
          link: _httpLink,
          cache: GraphQLCache(
            store: HiveStore(),
          )));
}
