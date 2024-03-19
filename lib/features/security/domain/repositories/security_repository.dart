import 'package:dartz/dartz.dart';
import 'package:stage_up/core/errors/failure.dart';
import 'package:stage_up/core/params/params.dart';
import 'package:stage_up/features/security/domain/entities/student.dart';

abstract class SecurityRepository {
  Future<Either<Failure, Student>> login(ParamsLogin paramsLogin);
}
