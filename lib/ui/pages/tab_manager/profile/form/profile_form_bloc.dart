import 'package:my_finance_flutter_3/core/domain/model/profile/profile_model.dart';
import 'package:my_finance_flutter_3/core/domain/repository/profile/profile_repository.dart';

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
