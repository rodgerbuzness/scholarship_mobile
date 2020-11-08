import 'package:dio/dio.dart';
import 'package:scholarship/application/classes/common/category.dart';
import 'package:scholarship/application/classes/common/pagination.dart';
import 'package:scholarship/application/classes/errors/common_error.dart';
import 'package:scholarship/application/classes/opportunity/opportunities.dart';
import 'package:scholarship/application/classes/opportunity/opportunity.dart';
import 'package:scholarship/application/scholarship_api.dart';
import 'package:scholarship/application/storage/localstorage.dart';
import 'package:scholarship/application/storage/storage_keys.dart';

abstract class OpportunityRepository {
  Future<Opportunities> getAllOpportunities(int page);
}

class OpportunityRepositoryImpl implements OpportunityRepository {
  @override
  Future<Opportunities> getAllOpportunities(int page) async {
    try {
      final response = await ScholarshipApi.dio.get(
          '/api/opportunity?page=$page',
          options: Options(headers: {
            'Authorization': 'Bearer ${LocalStorage.getItem(TOKEN)}'
          }));
      List _temp = response.data['data'];
      var _meta = response.data['meta'];

      Pagination pagination = Pagination.fromJson(_meta);

      List<Opportunity> _opportunities = _temp
          .map((opportunity) => Opportunity.fromJson(opportunity))
          .toList();
      return new Opportunities(
        opportunities: _opportunities,
        pagination: pagination,
      );
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
