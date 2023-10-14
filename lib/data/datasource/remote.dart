import 'dart:developer';

import 'package:bmas/data/model/section_model.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource({required this.dio});

  Future<List<SectionModel>> getHomeContent() async {
    try {
      final response = await dio.get('/home');
      final listData = (response.data['data'] as List);
      return listData.map((e) => SectionModel.fromJson(e)).toList();
    } catch (e) {
      log('---> ERROR get HOME CONTENT $e');
      rethrow;
    }
  }
}
