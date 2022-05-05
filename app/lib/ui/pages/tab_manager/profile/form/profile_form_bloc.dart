import 'package:database_domain/domain.dart';
import 'package:my_finance_flutter/core/domain/repository/profile/profile_repository.dart';

class ProfileFormBloc {
  ProfileFormBloc(this.profileRepository);

  final ProfileRepository profileRepository;

  String name = '';
  String currency = '';

  Future<bool> save() async {
    var model = ProfileModel(name: name, currency: currency);
    await profileRepository.save(model);
    return true;
  }
}
