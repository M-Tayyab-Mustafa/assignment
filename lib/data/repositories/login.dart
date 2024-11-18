import '../export.dart';

class LoginRepoImp implements LoginRepoAbst {
  LoginRepoImp._privateConstructor();
  factory LoginRepoImp() => LoginRepoImp._privateConstructor();

  static LoginRepoImp get instance => LoginRepoImp();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GitHubSignIn _githubSignIn = GitHubSignIn(
    clientId: dotenv.env['GITHUB_CLIENT_ID']!,
    clientSecret: dotenv.env['GITHUB_CLIENT_SECRET']!,
    redirectUrl: dotenv.env['GITHUB_REDIRECT_URL']!,
  );

  @override
  FutureOr<UserModel?> loginUsingEmailPassword(LoginParams loginParams) async {
    try {
      if (kDebugMode) {
        log('Login Params: ${loginParams.toString()}');
      }
      var userCredentials = await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginParams.email, password: loginParams.password);
      var user = userCredentials.user;
      if (user != null) {
        return UserModel(
          id: user.uid,
          name: user.displayName ?? 'Unknown',
          email: user.email ?? '',
          phoneNumber: user.phoneNumber ?? '',
          career: '',
          address: '',
          imageUrl: user.photoURL,
        );
      }
    } on FirebaseAuthException catch (error) {
      if (kDebugMode) {
        log('FirebaseAuthException: ${error.code}');
      }
      String errorMessage = 'Authentication failed';
      switch (error.code) {
        case 'invalid-credential':
          errorMessage = 'No user account found for the provided email address.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many attempts detected. Please try again after some time.';
          break;
        default:
          errorMessage = 'An unexpected error has occurred. Please try again later.';
          break;
      }

      await AppHelper.showErrorToast(errorMessage);
    } catch (error) {
      if (kDebugMode) {
        log('Login Error: $error');
      }
      await AppHelper.showErrorToast('Something went wrong! Try again later.');
    }
    return null;
  }

  @override
  FutureOr<UserModel?> loginUsingGoogle() async {
    try {
      late GoogleSignInAccount? googleAccountData;
      if (await _googleSignIn.isSignedIn()) {
        googleAccountData = await _googleSignIn.signInSilently(reAuthenticate: false);
      } else {
        googleAccountData = await _googleSignIn.signIn();
      }
      if (googleAccountData != null) {
        var googleAuth = await googleAccountData.authentication;
        var credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        var user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        if (user != null) {
          return UserModel(
            id: user.uid,
            name: user.displayName ?? 'Unknown',
            email: user.email ?? '',
            phoneNumber: user.phoneNumber ?? '',
            career: '',
            address: '',
            imageUrl: user.photoURL,
          );
        }
      }
    } catch (error) {
      if (kDebugMode) {
        log('Login Error: $error');
      }
      await AppHelper.showErrorToast('Something went wrong! Try again later.');
    }
    return null;
  }

  @override
  FutureOr<UserModel?> loginUsingGithub(BuildContext context) async {
    try {
      var result = await _githubSignIn.signIn(context);
      var token = result.token;
      if (token != null) {
        var user = (await FirebaseAuth.instance.signInWithCustomToken(token)).user;
        if (user != null) {
          return UserModel(
            id: user.uid,
            name: user.displayName ?? 'Unknown',
            email: user.email ?? '',
            phoneNumber: user.phoneNumber ?? '',
            career: '',
            address: '',
            imageUrl: user.photoURL,
          );
        }
      }
    } catch (error) {
      if (kDebugMode) {
        log('Login Error: $error');
      }
      await AppHelper.showErrorToast('Something went wrong! Try again later.');
    }
    return null;
  }
}
