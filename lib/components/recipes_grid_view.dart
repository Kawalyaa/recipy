import 'package:flutter/material.dart';

import '../models/models.dart';
import 'components.dart';

class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipe;
  const RecipesGridView({
    required this.recipe,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
          itemCount: recipe.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
          ),
          itemBuilder: (context, index) {
            final simpleRecipe = recipe[index];
            return RecipeThumbnail(
              recipe: simpleRecipe,
            );
          }),
    );
  }
}
