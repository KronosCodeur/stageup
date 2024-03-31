import 'package:dartz/dartz.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/core/usecases/usecase.dart';
import 'package:stageup/features/applications/domain/repositories/application_repository.dart';
import 'package:stageup/skeleton/Dto/request_response.dart';

class Apply implements UseCase<RequestResponse, ApplyParams> {
  final ApplicationRepository applicationRepository;

  Apply({required this.applicationRepository});

  @override
  Future<Either<Failure, RequestResponse>> call(ApplyParams params) async {
    return await applicationRepository.apply(params);
  }
}
