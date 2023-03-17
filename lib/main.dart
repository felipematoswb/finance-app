import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

import 'package:flutter/material.dart';
import 'package:todo_app/models/ModelProvider.dart';
import 'package:todo_app/pages/home/home_page.dart';

import 'amplifyconfiguration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();

  runApp(const DartFirstAmplifyAuthenticationApp());
}

Future<void> _configureAmplify() async {
  try {
    final authPlugin = AmplifyAuthCognito();
    final apiPlugin = AmplifyAPI();
    final datastorePlugin = AmplifyDataStore(
      modelProvider: ModelProvider.instance,
    );

    await Amplify.addPlugins([authPlugin, datastorePlugin, apiPlugin]);

    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    safePrint('An error occurred while configuring Amplify: $e');
  }
}

class DartFirstAmplifyAuthenticationApp extends StatelessWidget {
  const DartFirstAmplifyAuthenticationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      // builder used to show a custom sign in and sign up experience
      authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
        const padding =
            EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 16);
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return Scaffold(
              body: Padding(
                padding: padding,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // app logo
                      const Center(child: FlutterLogo(size: 100)),
                      // prebuilt sign in form from amplify_authenticator package
                      SignInForm(),
                    ],
                  ),
                ),
              ),
              // custom button to take the user to sign up
              persistentFooterButtons: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontFamily: 'Matterhorn'),
                    ),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signUp,
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            );
          case AuthenticatorStep.signUp:
            return Scaffold(
              body: Padding(
                padding: padding,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // app logo
                      const Center(child: FlutterLogo(size: 100)),
                      // prebuilt sign up form from amplify_authenticator package
                      SignUpForm.custom(
                        fields: [
                          SignUpFormField.nickname(required: true),
                          SignUpFormField.email(required: true),
                          SignUpFormField.password(),
                          SignUpFormField.passwordConfirmation(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // custom button to take the user to sign in
              persistentFooterButtons: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signIn,
                      ),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ],
            );
          default:
            // returning null defaults to the prebuilt authenticator for all other steps
            return null;
        }
      },

      child: MaterialApp(
        builder: Authenticator.builder(),
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        home: const HomePage(),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
