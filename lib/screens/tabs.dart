import 'package:flutter/material.dart';
import './categories.dart';
import './favorite.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;
  TabsScreen(this._favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget._favoriteMeals), 'title': 'Favorites'}
    ];
  }

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            title: Text('Category'),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
