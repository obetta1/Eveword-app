part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unAuthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? authUser;
  final UserModel? user;

  const AuthState._(
      {this.status = AuthStatus.unknown, this.authUser, this.user});

  const AuthState.unknown() : this._();

  const AuthState.authenticated(
      {final auth.User? authUser, final UserModel? user})
      : this._(
            status: AuthStatus.authenticated, user: user, authUser: authUser);

  const AuthState.unAuthenticated()
      : this._(
          status: AuthStatus.unAuthenticated,
        );

  @override
  List<Object> get props => [];
}

//class AuthInitial extends AuthState {}
