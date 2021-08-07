library firebase_apple_auth;

import 'package:firebase_auth/firebase_auth.dart';
import './firebase_auth_oauth_platform_interface.dart' as platform;
import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthOAuth implements platform.FirebaseAuthOAuth {
  final platform.FirebaseAuthOAuth _delegate;

  FirebaseAuthOAuth({FirebaseApp? app})
      : _delegate = app != null
            ? platform.FirebaseAuthOAuth.instance.withApp(app)
            : platform.FirebaseAuthOAuth.instance;

  @override
  Future<User?> openSignInFlow(String provider, List<String> scopes,
          [Map<String, String>? customOAuthParameters]) =>
      _delegate.openSignInFlow(provider, scopes, customOAuthParameters);

  @override
  Future<User?> linkExistingUserWithCredentials(
          String provider, List<String> scopes,
          [Map<String, String>? customOAuthParameters]) =>
      _delegate.linkExistingUserWithCredentials(
          provider, scopes, customOAuthParameters);

  @override
  platform.FirebaseAuthOAuth withApp(FirebaseApp app) =>
      FirebaseAuthOAuth(app: app);
}
