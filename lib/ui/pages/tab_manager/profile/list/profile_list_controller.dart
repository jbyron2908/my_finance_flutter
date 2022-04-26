import 'package:my_finance_flutter_3/core/domain/model/profile/profile_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/profile/profile_repository.dart';
import 'package:rxdart/subjects.dart';

class ProfileListController {
  ProfileListController(this.profileRepository);

  final ProfileRepository profileRepository;

  final BehaviorSubject<ProfileListState> state =
      BehaviorSubject.seeded(Loading());

  void watch() async {
    var profileStream = await profileRepository.watchAll();
    state.add(Idle(profileStream));
  }

  Future deleteProfile(ProfileModel profile) {
    return profileRepository.delete(profile);
  }
}

abstract class ProfileListState {}

class Loading implements ProfileListState {}

class Idle implements ProfileListState {
  Idle(this.profileListStream);

  final Stream<List<ProfileModel>> profileListStream;
}
