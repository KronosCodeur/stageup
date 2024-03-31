import 'package:dartz/dartz.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/security/data/models/user_model.dart';
import 'package:stageup/skeleton/Dto/request_response.dart';

abstract class SecurityRepository {
  Future<Either<Failure, UserModel>> login(ParamsLogin paramsLogin);

  Future<Either<Failure, RequestResponse>> register(
      ParamsRegister paramsRegister);

  Future<Either<Failure, RequestResponse>> uploadProfile(
      UploadProfileParam param);
}
