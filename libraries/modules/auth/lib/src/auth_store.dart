import 'package:auth/src/dialogs/sign_in_dialog.dart';
import 'package:auth/src/utils/auth_assets.dart';
import 'package:dependency_manager/flutter_triple.dart';
import 'package:dependency_manager/rive.dart';

class AuthStore extends NotifierStore<Exception, bool> {
  final ISignInDialog signInDialog;

  AuthStore(this.signInDialog) : super(false);

  final RiveAnimationController btnAnimationColtroller =
      OneShotAnimation(AuthAssets.buttonAnimationActive, autoplay: false);

  Future<void> start() async {
    btnAnimationColtroller.isActive = true;
    await Future.delayed(const Duration(milliseconds: 800));
    signInDialog.show(onClosed: () {});
  }
}
