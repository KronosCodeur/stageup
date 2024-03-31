import 'package:dartz/dartz.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/core/usecases/usecase.dart';
import 'package:stageup/features/applications/data/models/application_model.dart';
import 'package:stageup/features/applications/domain/repositories/application_repository.dart';

class GetUserApplications implements UseCase<List<ApplicationModel>, NoParams> {
  final ApplicationRepository applicationRepository;

  GetUserApplications({required this.applicationRepository});

  @override
  Future<Either<Failure, List<ApplicationModel>>> call(params) async {
    return await applicationRepository.getUserApplications();
  }
}
