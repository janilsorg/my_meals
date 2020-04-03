import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function savedFilters;
  final Map<String, bool> curFilters;

  FilterScreen(this.curFilters, this.savedFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() { 
    super.initState();
    _glutenFree = widget.curFilters['gluten'];
    _vegetarian = widget.curFilters['vegetarian'];
    _vegan = widget.curFilters['vegan'];
    _lactoseFree = widget.curFilters['lactose'];
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool curValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: curValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedFilters = {
                'gluten':_glutenFree,
                'lactose':_lactoseFree,
                'vegan':_vegan,
                'vegetarian':_vegetarian,
              };
              widget.savedFilters(_selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                'Gluten-free',
                'Only include gluten-free meals',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only include vegan meals',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Lactose-free',
                'Only include lactose-free meals',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
