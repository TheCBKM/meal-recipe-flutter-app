import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> currfilters;

  FilterScreen(this.setFilters, this.currfilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactose = false;

  @override
  initState() {
    _glutenFree = widget.currfilters['gluten'];
    _lactose = widget.currfilters['lactose'];
    _vegan = widget.currfilters['vegan'];
    _vegetarian = widget.currfilters['vege'];
    super.initState();
  }

  Widget _buildSwitchListTitle(
      String title, String desc, bool value, Function updateVal) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(desc),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> _filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactose,
                  'vege': _vegetarian,
                  'vegan': _vegan,
                };

                widget.setFilters(_filters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTitle("Gluten-free",
                      "Only include Gluten-free meals,", _glutenFree, (v) {
                    setState(
                      () {
                        _glutenFree = v;
                      },
                    );
                    Map<String, bool> _filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactose,
                  'vege': _vegetarian,
                  'vegan': _vegan,
                };

                widget.setFilters(_filters);
                  }),
                  _buildSwitchListTitle("Lactose-free",
                      "Only include Lactose-free meals,", _lactose, (v) {
                    setState(
                      () {
                        _lactose = v;
                      },
                    );
                    Map<String, bool> _filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactose,
                  'vege': _vegetarian,
                  'vegan': _vegan,
                };

                widget.setFilters(_filters);
                  }),
                  _buildSwitchListTitle("Vegiterian",
                      "Only include Vegiterian meals,", _vegetarian, (v) {
                    setState(
                      () {
                        _vegetarian = v;
                      },
                    );
                    Map<String, bool> _filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactose,
                  'vege': _vegetarian,
                  'vegan': _vegan,
                };

                widget.setFilters(_filters);
                  }),
                  _buildSwitchListTitle(
                      "Vegan", "Only include Vegan meals,", _vegan, (v) {
                    setState(
                      () {
                        _vegan = v;
                      },
                    );
                    Map<String, bool> _filters = {
                  'gluten': _glutenFree,
                  'lactose': _lactose,
                  'vege': _vegetarian,
                  'vegan': _vegan,
                };

                widget.setFilters(_filters);
                  })
                ],
              ),
            )
          ],
        ));
  }
}
