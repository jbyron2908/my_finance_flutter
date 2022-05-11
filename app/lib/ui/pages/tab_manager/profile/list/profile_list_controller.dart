import 'package:database_domain/domain.dart';
import 'package:my_finance_flutter/core/domain/repository/profile/profile_repository.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:theme/widget.dart';

class ProfileListController extends WidgetController {
  ProfileListController(this.profileRepository);

  final ProfileRepository profileRepository;

  final RxNotifier<ProfileListState> state = RxNotifier(Loading());

  @override
  void onReady() {
    watch();
  }

  void watch() async {
    var profileStream = await profileRepository.watchAll();
    state.value = Idle(profileStream);
  }

  Future deleteProfile(ProfileModel profile) {
    return profileRepository.delete(profile);
  }
}

abstract class ProfileListState {}

class Loading implements ProfileListState {}

class Idle implements ProfileListState {
  Idle(
    this.profileListStream,
  ) {
    var count1 = 0;
    count = RxNotifier(count1);
    profileList = profileListStream.asRx();
  }

  final Stream<List<ProfileModel>> profileListStream;
  late RxNotifier<int> count;
  late RxStream<List<ProfileModel>> profileList;
}
