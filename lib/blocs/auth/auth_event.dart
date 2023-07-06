part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserChangedEvent extends AuthEvent {
  final auth.User? authUser;
  final UserModel? user;

  const AuthUserChangedEvent({this.authUser, this.user});

  @override
  List<Object> get props => [authUser!, user!];
}
class SignUpEvent extends AuthEvent{
  final String email;
  final String password;
  const SignUpEvent({required this.email, required this.password, });

  @override
  List<Object> get props => [email, password];
}

class LoginUserEvent extends AuthEvent{
  final String email;
  final String password;
  const LoginUserEvent({required this.email, required this.password, });

  @override
  List<Object> get props => [email, password];
}

class UpadateUserProfileEvent extends AuthEvent{
  final UserModel userModel;

 const UpadateUserProfileEvent({required this.userModel});

}

class LogoutUserEvent extends AuthEvent{
  @override
List<Object> get props => [];}