import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SocialLogin {
  Future<String> login();
}

class GoogleSocialLogin implements SocialLogin {
  @override
  Future<String> login() async {
    final googleSignInAccount = await GoogleSignIn(scopes: [
      'email',
    ]).signIn();
    final authentication = await googleSignInAccount.authentication;
    final credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final userToken = await authResult.user.getIdToken(refresh: true);
    return userToken.token;
  }
}

class FacebookSocialLogin implements SocialLogin {
  @override
  Future<String> login() async {
    final result = await FacebookLogin().logIn(['email', 'public_profile']);
    final credential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token);

    final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final userToken = await authResult.user.getIdToken(refresh: true);
    return userToken.token;
  }
}

class TwitterSocialLogin implements SocialLogin {
  @override
  Future<String> login() async {
    var remoteConfig = await RemoteConfig.instance;
    await remoteConfig.fetch(expiration: Duration(minutes: 5));
    await remoteConfig.activateFetched();

    var twitterLogin = TwitterLogin(
        consumerKey: remoteConfig.getString('TWITTER_CONSUMER_KEY'),
        consumerSecret: remoteConfig.getString('TWITTER_CONSUMER_SECRET'));
    var result = await twitterLogin.authorize();
    var credential = TwitterAuthProvider.getCredential(
        authToken: result.session.token,
        authTokenSecret: result.session.secret);

    final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final userToken = await authResult.user.getIdToken(refresh: true);
    return userToken.token;
  }
}
