import 'package:flutter/material.dart';

import '../../domain/entities/comic_entity.dart';

class ComicDetails extends StatelessWidget {
  const ComicDetails({super.key, required this.comic});

  final ComicEntity comic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Center(
              child: SizedBox(
                width: 800,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context), 
                          icon: const Icon(Icons.arrow_back_ios_new_rounded)
                        ),
                        const Text('ComicBook', style: TextStyle(fontSize: 42)),
                        IconButton(
                          onPressed: null, 
                          icon: Container()
                        )
                      ],
                    ),
              
                    const SizedBox(height: 40),
              
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Characters', 
                                style: TextStyle(
                                  fontSize: 20, 
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              const Divider(),
                              
                              Text('Teams', 
                                style: TextStyle(
                                  fontSize: 20, 
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              const Divider(),

                              Text('Locations', 
                                style: TextStyle(
                                  fontSize: 20, 
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              const Divider(), 

                              Text('Concepts', 
                                style: TextStyle(
                                  fontSize: 20, 
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              const Divider(),                   
                            ],
                          ),
                        ),

                        const SizedBox(width: 20),

                        Container(
                          height: 600,
                          width: 380,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                            image: comic.imageURL != null 
                              ? DecorationImage(image: NetworkImage(comic.imageURL!))
                              : null
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Column(
              children: [

              ],
            );
          }
        },
      ),
    );
  }
}