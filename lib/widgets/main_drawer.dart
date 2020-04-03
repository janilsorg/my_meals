import 'package:flutter/material.dart';
import '../screens/filter.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buidListTile(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(icon, size: 26),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buidListTile(
            'Meals',
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buidListTile(
            'filters',
            Icons.settings,
            () => Navigator.of(context).pushReplacementNamed(FilterScreen.routeName),
          ),
        ],
      ),
    );
  }
}
