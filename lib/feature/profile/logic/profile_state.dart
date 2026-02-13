part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {} // جديد

class ProfileLoaded extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
}