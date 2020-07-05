import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  Widget _buildSwitchTitle(
    String title,
    String subTitle,
    bool currentValue,
    Function _onChangeHandler,
  ) {
    return SwitchListTile.adaptive(
      onChanged: _onChangeHandler,
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal filter',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTitle(
                  'Gluten-free',
                  'Only include Gluten-free meal',
                  _isGlutenFree,
                  (newVal) {
                    setState(
                      () {
                        _isGlutenFree = newVal;
                      },
                    );
                  },
                ),
                _buildSwitchTitle(
                  'Vegetarian',
                  'Only include Vegetarian meal',
                  _isVegetarian,
                  (newVal) {
                    setState(
                      () {
                        _isVegetarian = newVal;
                      },
                    );
                  },
                ),
                _buildSwitchTitle(
                  'Vegan',
                  'Only include Vegan meal',
                  _isVegan,
                  (newVal) {
                    setState(
                      () {
                        _isVegan = newVal;
                      },
                    );
                  },
                ),
                _buildSwitchTitle(
                  'Lactose-free',
                  'Only include Lactose-free meal',
                  _isLactoseFree,
                  (newVal) {
                    setState(
                      () {
                        _isLactoseFree = newVal;
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
