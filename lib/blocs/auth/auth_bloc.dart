import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomerce/models/user_model.dart';
import 'package:ecomerce/repository/aut/aut_repository.dart';
import 'package:ecomerce/repository/user/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  StreamSubscription<auth.User?>? _authSubscription;
  StreamSubscription<UserModel?>? _userSubscription;

  AuthBloc(
      {required AuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(AuthState.unknown()) {
    on<AuthUserChangedEvent>(_authUserChangedEvent);
    on<SignUpEvent>(_signupUser);
    on<LoginUserEvent>(_loginUser);
    on<UpadateUserProfileEvent>(_UpadateUserProfileEvent);
    on<LogoutUserEvent>(_logoutUser);

 checkstatus();
  }


  FutureOr<void> checkstatus(){
    _authSubscription = _authRepository.users.listen((authUser) async {
      if (authUser != null) {
        _userSubscription = _userRepository.getUsers(authUser.uid).listen((user) {
          add(AuthUserChangedEvent(authUser: authUser, user: user));
          print('auth get user======$user');
        });
        print('auth _userSubscription======$_userSubscription');
      } else {
        add(AuthUserChangedEvent(authUser: authUser));
        print('authuser======$authUser');
      }
    });
  }

  FutureOr<void> _authUserChangedEvent(
      AuthUserChangedEvent event, Emitter<AuthState> emit) {
    print('event authuser===${event.authUser}');
    if(event.authUser != null)
        {
      emit(AuthState.authenticated(authUser: event.authUser, user: event.user));
    print('auth _authUserChangedEvent=====${state.status}');
        }
        else {
      emit(const AuthState.unAuthenticated());

    print('auth get state======${state.status}');

    }
  }

  FutureOr<void> _signupUser  (
      SignUpEvent event,
      Emitter<AuthState> emit) async {
    final user =  await _authRepository.signUp(email: event.email, password:event.password );
    _userRepository.createUser(UserModel(id: user!.uid, email: user.email!, fullName: '',
        address: 'ad', city: 'cy', zipecode: '45', counntry: 'nid'));
    print('signup ========$user');
     emit(const AuthState.unAuthenticated());
  }

  FutureOr<void> _loginUser(
      LoginUserEvent event,
      Emitter<AuthState> emit) async {
    var  user = await _authRepository.loginWithEmailAndPassword(email: event.email,
        password: event.password);

    emit( AuthState.authenticated());
     add(AuthUserChangedEvent());
    checkstatus();
  }

  FutureOr<void> _UpadateUserProfileEvent(
      UpadateUserProfileEvent event,
      Emitter<AuthState> emit) async{
    await _userRepository.updateIUser(event.userModel);

  }

  FutureOr<void> _logoutUser(
      LogoutUserEvent event,
      Emitter<AuthState> emit) {
    _authSubscription!.cancel();
    _userSubscription!.cancel();
    var user = _authRepository.logout();
    emit(AuthState.unAuthenticated());
    checkstatus();


  }
  @override
  Future<void> close() {
    _authSubscription!.cancel();
    _userSubscription!.cancel();
    return super.close();
  }


}
