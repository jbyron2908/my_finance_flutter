import 'package:my_finance_flutter_3/core/domain/model/profile/profile_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/profile/profile_repository.dart';

class ProfileListController {
  ProfileListController(this.profileRepository);

  final ProfileRepository profileRepository;

  Future deleteProfile(ProfileModel profile) {
    return profileRepository.delete(profile);
  }
}
