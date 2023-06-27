import 'package:flutter/material.dart';

import '../../domain/entities/comic_entity.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.item, required this.onTap,
  });

  final ComicEntity item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(3),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(3),
                image: item.imageURL != null 
                  ? DecorationImage(image: NetworkImage(item.imageURL!))
                  : null
              )
            ),
    
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${item.title} - ${item.issueNumber}',
                  textAlign: TextAlign.center, 
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 16,
                    color: Colors.black
                  )
                ),
    
                const SizedBox(height: 10),
    
                Text(item.date,
                  textAlign: TextAlign.center, 
                    style: const TextStyle(
                    color: Colors.black54, 
                    fontSize: 14
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}