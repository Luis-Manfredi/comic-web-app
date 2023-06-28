import 'package:flutter/material.dart';

import '../../domain/entities/comic_entity.dart';

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({
    super.key,
    required this.item, 
    required this.onTap,
  });

  final ComicEntity item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(3),
      onTap: onTap,
      child: GridTile(
        child: Column(
          children: [
            Container(
              height: 220,
              width: 170,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(3),
                image: item.imageURL != null 
                  ? DecorationImage(image: NetworkImage(item.imageURL!))
                  : null
              ),
            ),
      
            const SizedBox(height: 30),
      
            Text('${item.title} - ${item.issueNumber}',
              textAlign: TextAlign.center, 
              style: const TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 16,
                color: Colors.black
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
    
            const SizedBox(height: 30),
    
            Text(item.date,
              textAlign: TextAlign.center, 
                style: const TextStyle(
                color: Colors.black54, 
                fontSize: 14
              )
            )
          ],
        ),
      ),
    );
  }
}