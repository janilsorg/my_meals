import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavoriteScreen extends StatelessWidget {

  final List<Meal> _favoriteMeals;
  FavoriteScreen(this._favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if(_favoriteMeals.isEmpty){
      return 
      Center(child: Text('Você ainda não tem nenhum favorito - adicione algum'));
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          // return Text(categoryMeals[index].title);
          return MealItem(
            id: _favoriteMeals[index].id,
            title: _favoriteMeals[index].title,
            imageUrl: _favoriteMeals[index].imageUrl,
            duration: _favoriteMeals[index].duration,
            affordability: _favoriteMeals[index].affordability,
            complexity: _favoriteMeals[index].complexity,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
    
  }
}