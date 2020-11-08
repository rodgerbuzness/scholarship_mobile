import 'package:flutter/foundation.dart';
import 'package:scholarship/application/classes/common/pagination.dart';
import 'package:scholarship/application/classes/opportunity/opportunity.dart';

class Opportunities {
  final Pagination pagination;
  final List<Opportunity> opportunities;

  Opportunities({
    @required this.opportunities,
    @required this.pagination,
  });
}
