import 'package:flutter/material.dart';
import 'package:scholarship/presentation/Opportunities/opportunities_page.dart';
import 'package:scholarship/presentation/auth/login_page.dart';
import 'package:scholarship/presentation/auth/register_page.dart';
import 'package:scholarship/presentation/opportunities/opportunity_detail.dart';
import 'package:scholarship/router/route_constants.dart';
import 'package:scholarship/presentation/not_found/not_found_page.dart';
import 'package:scholarship/presentation/home/home_page.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case opportunitiesRoute:
        return MaterialPageRoute(builder: (_) => OpportunitiesPage());
      case opportunityDetailRoute:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => OpportunityDetailPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
