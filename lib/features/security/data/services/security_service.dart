import 'package:dartz/dartz.dart';
import 'package:stageup/core/connection/network_info.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/security/data/models/user_model.dart';
import 'package:stageup/features/security/data/sources/remote/user_security_remote_source.dart';
import 'package:stageup/features/security/domain/repositories/security_repository.dart';
import 'package:stageup/skeleton/Dto/request_response.dart';

class SecurityService implements SecurityRepository {
  final INetworkInfo networkInfo;
  final UserSecurityRemoteSource userSecurityRemoteSource;

  SecurityService(
      {required this.networkInfo, required this.userSecurityRemoteSource});

  @override
  Future<Either<Failure, UserModel>> login(ParamsLogin paramsLogin) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await userSecurityRemoteSource.login(paramsLogin);
        return response.fold(
            (l) => Left(ServerFailure(errorMessage: l.message)),
            (r) => Right(r));
      } catch (e) {
        return Left(ServerFailure(
            errorMessage:
                "Erreur de connexion au serveur, veuillez réessayer plus tard !!!"));
      }
    } else {
      return Left(ServerFailure(
          errorMessage: "Vous n'etes pas connecté à internet !!!"));
    }
  }

  @override
  Future<Either<Failure, RequestResponse>> register(
      ParamsRegister paramsRegister) async {
    if (await networkInfo.isConnected!) {
      try {
        final response =
            await userSecurityRemoteSource.register(paramsRegister);
        return Right(response);
      } catch (e) {
        return Left(ServerFailure(
            errorMessage:
                "Erreur de connexion au serveur, veuillez réessayer plus tard !!!"));
      }
    } else {
      return Left(ServerFailure(
          errorMessage: "Vous n'etes pas connecté à internet !!!"));
    }
  }

  @override
  Future<Either<Failure, RequestResponse>> uploadProfile(
      UploadProfileParam param) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await userSecurityRemoteSource.uploadProfile(param);
        return Right(response);
      } catch (e) {
        return Left(ServerFailure(
            errorMessage:
                "Erreur de connexion au serveur, veuillez réessayer plus tard !!!"));
      }
    } else {
      return Left(ServerFailure(
          errorMessage: "Vous n'etes pas connecté à internet !!!"));
    }
  }
}
