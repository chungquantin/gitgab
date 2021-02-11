import 'package:flutter/material.dart';

class IconWithBadge extends StatelessWidget {
  final IconData icon;
  final String badge;
  IconWithBadge({@required this.icon, @required this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Icon(
            this.icon,
            size: 25,
          ),
          this.badge.length != 0
              ? Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color:Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 15,
                      minHeight: 12,
                    ),
                    child: Text(
                      this.badge,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Text("")
        ],
      ),
    );
  }
}
