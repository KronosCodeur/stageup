import 'package:dartz/dartz.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/features/interships/data/models/intership_model.dart';

abstract class InternshipRepository {
  Future<Either<Failure, List<InternshipModel>>> getAll(NoParams noParams);
}
