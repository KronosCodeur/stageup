import 'package:dartz/dartz.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/core/params/params.dart';
import 'package:stageup/core/usecases/usecase.dart';
import 'package:stageup/features/interships/data/models/intership_model.dart';
import 'package:stageup/features/interships/domain/repositories/internships_repository.dart';

class GetAllInternships implements UseCase<List<InternshipModel>, NoParams> {
  final InternshipRepository internshipRepository;

  GetAllInternships({
    required this.internshipRepository,
  });

  @override
  Future<Either<Failure, List<InternshipModel>>> call(NoParams params) async {
    return await internshipRepository.getAll(params);
  }
}
