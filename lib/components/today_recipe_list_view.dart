import 'package:flutter/material.dart';
import '../models/explore_recipe.dart';
import '../components/components.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({required this.recipes, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day "',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 16),
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 16,
                    ),
                itemCount: recipes.length),
          )
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
