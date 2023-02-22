import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter/repository/user.dart';
import 'package:equatable/equatable.dart';
import 'package:study_flutter/repository/authentication_repository.dart';
import 'dart:async';

import 'package:study_flutter/repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  //
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {}
}
