import 'package:flutter/material.dart';
import 'package:scholarship/application/state/opportunity_state.dart';
import 'package:scholarship/router/route_constants.dart';
import 'package:scholarship/value/images.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class OpportunitiesPage extends StatefulWidget {
  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage>
    with AutomaticKeepAliveClientMixin {
  final _opportunitiesStateRm = RM.get<OpportunityState>();
  ScrollController _scrollController;

  @override
  void didChangeDependencies() {
    _scrollController = ScrollController();
    _getNewOpportunities();

    _scrollController.addListener(() {
      double currentPosition = _scrollController.position.pixels;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      if (currentPosition >= maxScrollExtent &&
          !_opportunitiesStateRm.state.loading) {
        _getNewOpportunities();
      }
    });

    super.didChangeDependencies();
  }

  void _getNewOpportunities() {
    _opportunitiesStateRm
        .setState((opportunitystate) => opportunitystate.getAllOpportunities());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Opportunities Page'),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: StateBuilder<OpportunityState>(
          observe: () => _opportunitiesStateRm,
          builder: (_, model) {
            return Column(
              children: [
                ...model.state.opportunities
                    .map((opportunity) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              opportunityDetailRoute,
                              arguments: opportunity,
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(Images.testImage),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 5,
                                ),
                                child: Text(
                                  '${opportunity.title}',
                                  style: TextStyle(
                                    fontFamily: 'Dosis',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.school),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${opportunity.category.name}',
                                          style: TextStyle(
                                            fontFamily: 'Dosis',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.remove_red_eye),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '134',
                                        style: TextStyle(
                                          fontFamily: 'Dosis',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                  FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.share),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Share',
                                          style: TextStyle(
                                            fontFamily: 'Dosis',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.event),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${opportunity.deadline}',
                                        style: TextStyle(
                                          fontFamily: 'Dosis',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
