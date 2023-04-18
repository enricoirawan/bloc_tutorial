import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_new_event.dart';
part 'profile_new_state.dart';

class ProfileNewBloc extends Bloc<ProfileNewEvent, ProfileNewState> {
  ProfileNewBloc() : super(ProfileNewState.initial()) {
    on<ProfileNewEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<UpdateProfileNewEvent>((event, emit) {
      emit(state.copyWith(
        name: event.name,
        gender: event.gender,
        status: "LOADED",
        errorMessage: "",
      ));
    });
  }
}
