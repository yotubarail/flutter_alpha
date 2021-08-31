// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/model/auth_model.dart';

// freezed生成ファイル
part 'signin_view_model.freezed.dart';

final signinViewModelProvider = StateNotifierProvider<SigninViewModel, dynamic>(
  (ref) => SigninViewModel(),
);

class SigninViewModel extends StateNotifier<SigninData> {
  SigninViewModel() : super(const SigninData());

  final auth = Auth();

  Future emailSignin() async {
    if (validateEmail() || validatePassword()) {
      print('フォームに正しく入力してください');
    } else {
      await auth.emailSignin(
        email: state.email,
        password: state.password,
      );
    }
  }

  Future emailSignup() async {
    if (validateEmail() || validatePassword()) {
      print('フォームに正しく入力してください');
    } else {
      await auth.emailSignup(
        email: state.email,
        password: state.password,
      );
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
abstract class SigninData with _$SigninData {
  const factory SigninData({
    @Default('test@test.com') String email,
    @Default('P@ssw0rd') String password,
  }) = _SigninData;
}
