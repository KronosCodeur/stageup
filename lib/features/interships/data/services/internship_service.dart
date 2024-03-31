import 'package:dartz/dartz.dart';
import 'package:stageup/core/connection/network_info.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/interships/data/models/intership_model.dart';
import 'package:stageup/features/interships/data/sources/local/internships_local_source.dart';
import 'package:stageup/features/interships/data/sources/remote/internships_remote_source.dart';
import 'package:stageup/features/interships/domain/repositories/internships_repository.dart';

class InternshipService implements InternshipRepository {
  final INetworkInfo iNetworkInfo;
  final InternshipLocalSource internshipLocalSource;
  final InternshipsRemoteSource internshipsRemoteSource;

  InternshipService({
    required this.iNetworkInfo,
    required this.internshipLocalSource,
    required this.internshipsRemoteSource,
  });

  @override
  Future<Either<Failure, List<InternshipModel>>> getAll(
      NoParams noParams) async {
    if (await iNetworkInfo.isConnected!) {
      try {
        var internships = await internshipsRemoteSource.getAll(noParams);
        await internshipLocalSource.cacheInternships(internships);
        return Right(internships);
      } catch (e) {
        return Left(
          ServerFailure(
            errorMessage: "Impossible de charger les offres en lignes !!!",
          ),
        );
      }
    } else {
      try {
        var internships = await internshipLocalSource.getCachedInternships();
        return Right(internships);
      } catch (e) {
        return Left(
          CacheFailure(
            errorMessage: "Impossible de charger les offres locales !!!",
          ),
        );
      }
    }
  }
}
