import 'package:vibed/modules/authentication/providers/models/email.dart';
import 'package:vibed/modules/authentication/providers/models/recover_state.dart';
import 'package:vibed/modules/authentication/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recoverStateProvider =
    StateNotifierProvider.autoDispose<RecoverStateNotifier, RecoverState>(
  (ref) => RecoverStateNotifier(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);

class RecoverStateNotifier extends StateNotifier<RecoverState> {
  final AuthenticationRepository _authRepository;

  RecoverStateNotifier({
    required AuthenticationRepository authRepository,
  })  : _authRepository = authRepository,
        super(
          RecoverState(email: Email("")),
        );

  void setEmail(String? value) {
    final email = Email(value ?? '');
    if (email == state.email) {
      return;
    }
    state = state.copyWith(email: email);
  }

  Future<void> send() async {
    if (state is RecoverStateSending) {
      return;
    }
    try {
      state.email.validate();
      state = RecoverState.sending(email: state.email);
      await _authRepository.recoverPassword(state.email.value);
      // lets fake a delay to prevent spamming the signup button
      await Future.delayed(const Duration(milliseconds: 1500));
      state = RecoverState.sent(email: state.email);
    } catch (e, trace) {
      debugPrint("Error while signing up: $e, $trace");
      state = RecoverState(email: state.email);
      rethrow;
    }
  }
}
