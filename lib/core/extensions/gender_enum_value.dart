import '../../modules/auth/ui/screens/sign_up/view_model/sign_up_state.dart';

extension GenderEnumValue on String {
  GenderEnum get toGenderEnumValue {
    switch (this) {
      case 'Male':
        return GenderEnum.male;
      case 'Female':
        return GenderEnum.female;
      default:
        throw Exception('Invalid GenderEnum value');
    }
  }
}
