part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginError extends AuthState {}


class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {}

class DataSuccess extends AuthState {}
class RegisterError extends AuthState {}
