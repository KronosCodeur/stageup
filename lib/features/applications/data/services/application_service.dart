import 'package:dartz/dartz.dart';
import 'package:stageup/core/connection/network_info.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/applications/data/models/application_model.dart';
import 'package:stageup/features/applications/data/sources/local/application_local_source.dart';
import 'package:stageup/features/applications/data/sources/remote/application_remote_source.dart';
import 'package:stageup/features/applications/domain/repositories/application_repository.dart';
import 'package:stageup/skeleton/Dto/request_response.dart';

class ApplicationService implements ApplicationRepository {
  final INetworkInfo iNetworkInfo;
  final ApplicationsRemoteSource applicationsRemoteSource;
  final ApplicationLocalSource applicationLocalSource;

  ApplicationService({
    required this.iNetworkInfo,
    required this.applicationsRemoteSource,
    required this.applicationLocalSource,
  });

  @override
  Future<Either<Failure, RequestResponse>> apply(
      ApplyParams applyParams) async {
    if (await iNetworkInfo.isConnected!) {
      try {
        final response = await applicationsRemoteSource.apply(applyParams);
        return Right(response);
      } catch (e) {
        return Left(
          ServerFailure(
            errorMessage:
                "Erreur de connexion au serveur, veuillez réessayer plus tard !!!",
          ),
        );
      }
    } else {
      return Left(ServerFailure(
          errorMessage: "Vous n'etes pas connecté à internet !!!"));
    }
  }

  @override
  Future<Either<Failure, List<ApplicationModel>>> getUserApplications() async {
    if (await iNetworkInfo.isConnected!) {
      try {
        var applications =
            await applicationsRemoteSource.getUserApplications(NoParams());
        await applicationLocalSource.cacheApplications(applications);
        return Right(applications);
      } catch (e) {
        return Left(
          ServerFailure(
            errorMessage: "Impossible de charger vos demandes en lignes !!!",
          ),
        );
      }
    } else {
      try {
        var applications = await applicationLocalSource.getCachedApplications();
        return Right(applications);
      } catch (e) {
        return Left(
          CacheFailure(
            errorMessage: "Impossible de charger vos demandes locales !!!",
          ),
        );
      }
    }
  }
}
