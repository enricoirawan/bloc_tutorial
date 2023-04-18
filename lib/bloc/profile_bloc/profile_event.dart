part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final String gender;

  const UpdateProfileEvent({required this.name, required this.gender});

  @override
  List<Object> get props => [name, gender];
}
