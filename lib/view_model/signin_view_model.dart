// 依存パッケージ
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 参照ファイル
import '/model/auth_model.dart';

// freezed生成ファイル
part 'signin_view_model.freezed.dart';

final infoTextProvider = StateProvider<String>((ref) => '');

final signinViewModelProvider =
    StateNotifierProvider<SigninViewModel, SigninData>(
  (ref) {
    final infoText = ref.watch(infoTextProvider);
    return SigninViewModel(infoText);
  },
);

class SigninViewModel extends StateNotifier<SigninData> {
  SigninViewModel(this.infoText) : super(const SigninData());

  final StateController<String> infoText;

  Future emailSignin() async {
    if (validateEmail() || validatePassword()) {
      infoText.state = 'error: フォームに正しく入力してください';
    } else {
      try {
        await Auth().emailSignin(
          email: state.email,
          password: state.password,
        );
      } on Exception catch (e) {
        infoText.state = 'error：${e.toString()}';
      }
    }
  }

  Future emailSignup() async {
    if (validateEmail() || validatePassword()) {
      infoText.state = 'error: フォームに正しく入力してください';
    } else {
      try {
        await Auth().emailSignup(
          email: state.email,
          password: state.password,
        );
      } on Exception catch (e) {
        infoText.state = 'error：${e.toString()}';
      }
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
    @Default('test@example.com') String email,
    @Default('P@ssw0rd') String password,
  }) = _SigninData;
}
