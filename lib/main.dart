import 'package:flutter/material.dart';
import 'package:scholarship/application/repositories/auth_repository.dart';
import 'package:scholarship/application/repositories/opportunity_repository.dart';
import 'package:scholarship/application/state/auth_state.dart';
import 'package:scholarship/application/state/opportunity_state.dart';
import 'package:scholarship/application/storage/localstorage.dart';
import 'package:scholarship/router/router.dart' as Router1;
import 'package:scholarship/router/route_constants.dart';
import 'package:scholarship/value/branding_color.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'application/storage/storage_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeSharedPreferences();
  runApp(Scholarship());
}

class Scholarship extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject<AuthState>(() => AuthState(AuthRepositoryImp())),
          Inject<OpportunityState>(
              () => OpportunityState(OpportunityRepositoryImpl())),
        ],
        builder: (context) {
          return MaterialApp(
            title: 'Scholarship',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'Dosis',
                primarySwatch: brandingColor,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            //home: OpportunitiesPage(),
            onGenerateRoute: Router1.Router.onGenerateRoute,
            initialRoute:
                LocalStorage.getItem(TOKEN) != null ? homeRoute : signInRoute,
          );
        });
  }
}
