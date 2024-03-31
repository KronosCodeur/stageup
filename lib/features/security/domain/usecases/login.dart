import 'package:dartz/dartz.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/core/usecases/usecase.dart';
import 'package:stageup/features/security/data/models/user_model.dart';
import 'package:stageup/features/security/domain/repositories/security_repository.dart';

class Login implements UseCase<UserModel, ParamsLogin> {
  final SecurityRepository securityRepository;

  Login({required this.securityRepository});

  @override
  Future<Either<Failure, UserModel>> call(ParamsLogin params) async {
    return await securityRepository.login(params);
  }
}
