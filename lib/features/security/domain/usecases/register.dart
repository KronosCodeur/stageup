import 'package:dartz/dartz.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/core/usecases/usecase.dart';
import 'package:stageup/features/security/domain/repositories/security_repository.dart';
import 'package:stageup/skeleton/Dto/request_response.dart';

class Register implements UseCase<RequestResponse, ParamsRegister> {
  final SecurityRepository securityRepository;

  Register({required this.securityRepository});

  @override
  Future<Either<Failure, RequestResponse>> call(ParamsRegister params) async {
    return await securityRepository.register(params);
  }
}
