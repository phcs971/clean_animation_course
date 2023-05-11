import 'package:auth/src/auth_store.dart';
import 'package:auth/src/dialogs/sign_in_dialog.dart';
import 'package:dependency_manager/flutter_modular.dart';

import 'auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => SignInDialog()),
    Bind.singleton((i) => AuthStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
  ];
}
