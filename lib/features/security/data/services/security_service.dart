import 'package:dartz/dartz.dart';
import 'package:stage_up/core/errors/failure.dart';
import 'package:stage_up/core/params/params.dart';
import 'package:stage_up/features/security/domain/entities/student.dart';
import 'package:stage_up/features/security/domain/repositories/security_repository.dart';

class SecurityService implements SecurityRepository {
  @override
  Future<Either<Failure, Student>> login(ParamsLogin paramsLogin) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
