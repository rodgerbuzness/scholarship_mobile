import 'package:scholarship/application/classes/common/pagination.dart';
import 'package:scholarship/application/classes/opportunity/opportunities.dart';
import 'package:scholarship/application/classes/opportunity/opportunity.dart';
import 'package:scholarship/application/repositories/opportunity_repository.dart';

class OpportunityState {
  final OpportunityRepository _opportunityRepository;

  OpportunityState(this._opportunityRepository);

  List<Opportunity> _opportunities = [];
  List<Opportunity> get opportunities => _opportunities;

  Pagination _pagination;
  bool _loading;
  bool get loading => _loading;

  Future getAllOpportunities() async {
    int currentPage = 1;
    bool fetchNext = false;

    if (_pagination == null) {
      fetchNext = true;
    } else if (_pagination != null &&
        _pagination.currentPage < _pagination.lastPage) {
      currentPage = _pagination.currentPage + 1;
    } else {
      fetchNext = false;
    }

    if (fetchNext) {
      _loading = true;
      Opportunities _newOpportunities =
          await _opportunityRepository.getAllOpportunities(currentPage);
      _opportunities.addAll(_newOpportunities.opportunities);
      _pagination = _newOpportunities.pagination;
      _loading = false;
    }
  }
}
