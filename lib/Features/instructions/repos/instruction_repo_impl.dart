// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/utils/Errors/failure.dart';
import 'package:gbsub/Features/instructions/Model/instruction_models.dart';
import 'package:gbsub/Features/instructions/repos/instruction_repo.dart';

class InstructionRepoImpl implements InstructionRepo {
  final ApiService apiService;

  InstructionRepoImpl({required this.apiService});
  List<HealthAdviceModel> healthadvices = [];

  @override
  Future<Either<Failure, List<HealthAdviceModel>>> fetchHealthAdvice(
      {required int pageNum, required int pagesize}) async {
    try {
      healthadvices = [];
      var data = await apiService.get(
          endPoint: '/HealthAdvice?pageNum=$pageNum&pagesize=$pagesize');

      for (int i = 0; i < data['doctor'].length; i++) {
        HealthAdviceModel healthAdviceModel = HealthAdviceModel.json(
            data['healthAdvice'][i], data['doctor'][i], data['spec'][i]);
        healthadvices.add(healthAdviceModel);
        print(healthadvices);
      }

      return right(healthadvices);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addNewHealthAdvice(
      {required int doctorId, required String content}) async {
    try {
      var response = await apiService.postNoBody(
          endPoint: '/HealthAdvice?doctorId=$doctorId&content=$content');
      return right(true);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
