import 'package:flutter/material.dart';
import 'package:recipy2/components/components.dart';
import 'package:recipy2/models/grocery_manager.dart';
import 'package:recipy2/screens/grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;
  const GroceryListScreen({required this.manager, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            return Dismissible(
              key: Key(item.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              onDismissed: (direction) {
                manager.deleteItem(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${item.name} dismissed',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                );
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroceryItemScreen(
                          originalItem: item,
                          onCreate: (item) {},
                          onUpdate: (item) {
                            manager.updateItem(item, index);
                            Navigator.pop(context);
                          }),
                    ),
                  );
                },
                child: GroceryTile(
                  key: Key(item.id),
                  item: item,
                  onComplete: (change) {
                    if (change != null) {
                      manager.completeItem(index, change);
                    }
                  },
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 16.0,
              ),
          itemCount: groceryItems.length),
    );
  }
}