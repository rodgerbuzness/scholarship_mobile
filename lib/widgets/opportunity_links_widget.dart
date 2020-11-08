import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class OpportunityLinksWidget extends StatelessWidget {
  final String categoryName;
  final String views;
  final String deadline;

  const OpportunityLinksWidget({
    Key key,
    @required this.categoryName,
    @required this.views,
    @required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                '$categoryName',
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
              '$views',
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
              '$deadline',
              style: TextStyle(
                fontFamily: 'Dosis',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ],
    );
  }
}
