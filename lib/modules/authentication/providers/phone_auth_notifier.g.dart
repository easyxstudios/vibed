// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$phoneAuthNotifierHash() => r'69fe22b6a7adaca8027a6051f2f161f147927f30';

/// This notifier is used to handle the phone number authentication flow
/// It is used to send the OTP code to the user's phone number
/// and to verify the OTP code
/// It is also used to link the phone number to the user
/// and to sign in the user with the phone number
///
/// -- if you enable anonymous mode we try to link the user to the phone number
/// -- if it fails we sign in the user with the phone number
///
/// Copied from [PhoneAuthNotifier].
@ProviderFor(PhoneAuthNotifier)
final phoneAuthNotifierProvider =
    AutoDisposeNotifierProvider<PhoneAuthNotifier, PhoneAuthState>.internal(
      PhoneAuthNotifier.new,
      name: r'phoneAuthNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$phoneAuthNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PhoneAuthNotifier = AutoDisposeNotifier<PhoneAuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
