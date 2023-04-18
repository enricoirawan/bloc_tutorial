part of 'profile_new_bloc.dart';

abstract class ProfileNewEvent extends Equatable {
  const ProfileNewEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileNewEvent extends ProfileNewEvent {
  final String name;
  final String gender;

  const UpdateProfileNewEvent({required this.name, required this.gender});

  @override
  List<Object> get props => [name, gender];
}
