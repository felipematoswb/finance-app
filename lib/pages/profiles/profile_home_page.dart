import 'dart:io';

import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileHomePage extends StatefulWidget {
  final String title;
  const ProfileHomePage({super.key, required this.title});

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  Future<AuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    return user;
  }

  Future<List<AuthUserAttribute>> fetchCurrentUserAttributes() async {
    final user = await Amplify.Auth.fetchUserAttributes();
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: FutureBuilder<AuthUser>(
                future: Amplify.Auth.getCurrentUser(),
                builder: (context, currentUserSnapshot) {
                  if (currentUserSnapshot.connectionState ==
                      ConnectionState.active) {
                    return const Text('Loading user');
                  } else {
                    return Text(
                      'Welcome to $_osPlatform ${currentUserSnapshot.data?.username}',
                    );
                  }
                },
              ),
            ),
            const SignOutButton(),
            FutureBuilder<AuthUser>(
              future: getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return Column(
                    children: [
                      Text('ID do usuário: ${user.userId}'),
                      Text('Nome de usuário: ${user.username}'),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else {
                  return const Text('Carregando...');
                }
              },
            ),
            FutureBuilder<List<AuthUserAttribute>>(
              future: fetchCurrentUserAttributes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final attributes = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final attribute in attributes)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                attribute.userAttributeKey.key,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(attribute.value),
                            ],
                          ),
                        ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else {
                  return const Text('Carregando...');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Returns a name to the current platform
  String get _osPlatform {
    if (kIsWeb) {
      return 'Web';
    } else if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isMacOS) {
      return 'macOS Desktop';
    } else if (Platform.isWindows) {
      return 'Windows Desktop';
    } else if (Platform.isLinux) {
      return 'Linux Desktop';
    } else {
      return 'Unknown';
    }
  }
}
