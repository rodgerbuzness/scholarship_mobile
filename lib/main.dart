import 'package:flutter/material.dart';
import 'package:scholarship/router/router.dart' as Router1;
import 'package:scholarship/router/route_constants.dart';

void main() {
  runApp(Scholarship());
}

class Scholarship extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scholarship',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      //home: OpportunitiesPage(),
      onGenerateRoute: Router1.Router.onGenerateRoute,
      initialRoute: opportunitiesRoute,
    );
  }
}
