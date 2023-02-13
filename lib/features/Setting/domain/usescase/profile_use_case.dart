import 'package:dartz/dartz.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/Setting/domain/baserepository/setting_base_repository.dart';
import 'package:shop_app/features/Setting/domain/entites/profile.dart';


class ProfileUseCase extends BaseUseCase<ProfileData , NoParameters >
{
  final SettingBaseRepository settingBaseRepository;

  ProfileUseCase(this.settingBaseRepository);

  @override
  Future<Either<Failure, ProfileData>> call(NoParameters parameters) async
  {
    return await settingBaseRepository.getProfileData();
  }
}