import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';
  List<Meal> avaliableMeals;

  CategoryMealsScreen(this.avaliableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loeadedInitdata = false;

  @override
  void initState() {
    //.. init nãe serve porque ainda não tem contexto
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // já tem contexto mas roda toda vez que o state muda
    // cria-se a variável _loeadedInitdata para checar isso
    if (!_loeadedInitdata) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.avaliableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loeadedInitdata = true;
    }
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // return Text(categoryMeals[index].title);
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
