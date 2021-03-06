import 'package:flutter/material.dart';

import '../models/models.dart';
import 'components.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;
  const FriendPostTile({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.comment),
              Text(
                '${post.timestamp} mins ago',
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        )
      ],
    );
  }
}
