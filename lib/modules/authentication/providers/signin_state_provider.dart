import 'package:vibed/core/states/user_state_notifier.dart';
import 'package:vibed/modules/authentication/providers/models/email.dart';
import 'package:vibed/modules/authentication/providers/models/password.dart';
import 'package:vibed/modules/authentication/providers/models/signin_state.dart';
import 'package:vibed/modules/authentication/providers/models/signup_state.dart';
import 'package:vibed/modules/authentication/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signinStateProvider =
    StateNotifierProvider.autoDispose<SigninStateNotifier, SigninState>(
  (ref) => SigninStateNotifier(
    authRepository: ref.watch(authRepositoryProvider),
    userStateNotifier: ref.watch(userStateNotifierProvider.notifier),
  ),
);

class SigninStateNotifier extends StateNotifier<SigninState> {
  final AuthenticationRepository _authRepository;
  final UserStateNotifier _userStateNotifier;

  SigninStateNotifier({
    required AuthenticationRepository authRepository,
    required UserStateNotifier userStateNotifier,
  })  : _authRepository = authRepository,
        _userStateNotifier = userStateNotifier,
        super(SigninState(email: Email(""), password: Password("")));

  void setEmail(String? value) {
    final email = Email(value ?? '');
    if (email == state.email) {
      return;
    }
    state = state.copyWith(email: email);
  }

  void setPassword(String? pwd) {
    final password = Password(pwd ?? '');
    if (password == state.password) {
      return;
    }
    state = state.copyWith(password: password);
  }

  Future<void> signin() async {
    if (state is SignupStateSending) {
      return;
    }
    try {
      state.email.validate();
      state.password.validate();
      state = SigninState.sending(email: state.email, password: state.password);
      await _authRepository.signin(state.email.value, state.password.value);
      // lets fake a delay to prevent spamming the signup button
      await Future.delayed(const Duration(milliseconds: 1500));
      await _userStateNotifier.onSignin();
    } catch (e, trace) {
      debugPrint("Error while signing up: $e, $trace");
      state = SigninState(email: state.email, password: state.password);
      rethrow;
    }
  }

  Future<void> signinWithGoogle() async {
    if (state is SignupStateSending) {
      return;
    }
    try {
      state = SigninState.sending(email: state.email, password: state.password);
      await _authRepository.signinWithGoogle();
      // lets fake a delay to prevent spamming the signup button
      await Future.delayed(const Duration(milliseconds: 1500));
      await _userStateNotifier.onSignin();
    } catch (e, trace) {
      debugPrint("Error while signing up: $e, $trace");
      state = SigninState(email: state.email, password: state.password);
      rethrow;
    }
  }

  Future<void> signinWithGooglePlayGames() async {
    if (state is SignupStateSending) {
      return;
    }
    try {
      state = SigninState.sending(email: state.email, password: state.password);
      await _authRepository.signinWithGooglePlayGames();
      // lets fake a delay to prevent spamming the signup button
      await Future.delayed(const Duration(milliseconds: 1500));
      await _userStateNotifier.onSignin();
    } catch (e, trace) {
      debugPrint("Error while signing up: $e, $trace");
      state = SigninState(email: state.email, password: state.password);
      rethrow;
    }
  }

  Future<void> signinWithApple() async {
    if (state is SignupStateSending) {
      return;
    }
    try {
      state = SigninState.sending(email: state.email, password: state.password);
      await _authRepository.signinWithApple();
      // lets fake a delay to prevent spamming the signup button
      await Future.delayed(const Duration(milliseconds: 1500));
      await _userStateNotifier.onSignin();
    } catch (e, trace) {
      debugPrint("Error while signing up: $e, $trace");
      state = SigninState(email: state.email, password: state.password);
      rethrow;
    }
  }

  Future<void> signinWithFacebook() async {
    if (state is SignupStateSending) {
      return;
    }
    try {
      state = SigninState.sending(email: state.email, password: state.password);
      await _authRepository.signinWithFacebook();
      // lets fake a delay to prevent spamming the signup button
      await Future.delayed(const Duration(milliseconds: 1500));
      await _userStateNotifier.onSignin();
    } catch (e, trace) {
      debugPrint("Error while signing up: $e, $trace");
      state = SigninState(email: state.email, password: state.password);
      rethrow;
    }
  }
}
