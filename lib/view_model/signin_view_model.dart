// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
// import '/model/signin_model.dart';

// freezed生成ファイル
part 'signin_view_model.freezed.dart';

// final authFutureProvider = Provider.autoDispose((ref) async {
//   final user = await ref.watch(authStreamProvider.last);
//   if (user != null) {
//     return user.uid;
//   } else {
//     return 'test no user';
//   }
// });

final signinViewModelProvider = StateNotifierProvider<SigninViewModel, dynamic>(
  (ref) => SigninViewModel(),
);

class SigninViewModel extends StateNotifier<AuthState> {
  SigninViewModel() : super(const AuthState());

  void emailSignin() {
    if (validateEmail() || validatePassword()) {
      print('フォームに正しく入力してください');
    } else {
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
    }
  }

  void emailSignup() {
    if (validateEmail() || validatePassword()) {
      print('フォームに正しく入力してください');
    } else {
      // FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: state.email,
      //   password: state.password,
      // );
      FirebaseAuth.instance.signOut();
    }
  }

  void changeEmail(String value) {
    state = state.copyWith(email: value);
  }

  void changePassword(String value) {
    state = state.copyWith(password: value);
  }

  bool validateEmail() {
    final emailPattern = RegExp(
        r'^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$');
    if (!emailPattern.hasMatch(state.email)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword() {
    if (state.password.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool signin,
    @Default('test@test.com') String email,
    @Default('P@ssw0rd') String password,
  }) = _AuthState;
}
