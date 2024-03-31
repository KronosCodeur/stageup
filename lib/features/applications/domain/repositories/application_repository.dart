import 'package:dartz/dartz.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/applications/data/models/application_model.dart';
import 'package:stageup/skeleton/Dto/request_response.dart';

abstract class ApplicationRepository {
  Future<Either<Failure, List<ApplicationModel>>> getUserApplications();

  Future<Either<Failure, RequestResponse>> apply(ApplyParams applyParams);
}
