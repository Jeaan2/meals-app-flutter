import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];

  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedScreenIndex]),
      ),
      body: _screens[_selectedScreenIndex],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
