import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favmeals;
  FavouritesScreen(this.favmeals);
  @override
  Widget build(BuildContext context) {
    if (favmeals.isEmpty)
      return Center(child: Text("You have no favourites - Start adding some "));
    else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final data = favmeals[index];
          return MealItem(
            id: data.id,
            title: data.title,
            affordability: data.affordability,
            complexity: data.complexity,
            duration: data.duration,
            imageUrl: data.imageUrl,
          );
        },
        itemCount: favmeals.length,
      );
  }
}
