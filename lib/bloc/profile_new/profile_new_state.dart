part of 'profile_new_bloc.dart';

class ProfileNewState extends Equatable {
  final String name;
  final String gender;
  final String errorMessage;
  final String status;

  const ProfileNewState({
    required this.name,
    required this.gender,
    required this.errorMessage,
    required this.status,
  });

  factory ProfileNewState.initial() {
    return const ProfileNewState(
        name: "", gender: "", errorMessage: "", status: "");
  }

  ProfileNewState copyWith({
    String? name,
    String? gender,
    String? errorMessage,
    String? status,
  }) {
    return ProfileNewState(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [name, gender, status];
}
