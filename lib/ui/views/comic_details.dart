import 'package:flutter/material.dart';

import '../../domain/entities/comic_entity.dart';
import '../utils/app_theme.dart';

class ComicDetails extends StatelessWidget {
  const ComicDetails({super.key, required this.comic});

  final ComicEntity comic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return SingleChildScrollView(
              child: Center(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                buildLabels('Characters'),
            
                                comic.characters == null || comic.characters!.isEmpty 
                                  ? const NoDataWidget()
                                  : GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: comic.characters!.length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      crossAxisCount: 2,
                                      mainAxisExtent: 50
                                    ), 
                                    itemBuilder: (context, index) {
                                      var item = comic.characters![index];
                                  
                                      return TextButton.icon(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          alignment: Alignment.centerLeft,
                                          foregroundColor: AppTheme.primaryColor
                                        ), 
                                        icon: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: AppTheme.primaryColor,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: const Icon(Icons.person, color: Colors.white54, size: 24),
                                        ), 
                                        label: Text(item['name'])
                                      );
                                    },
                                  ),

                              const SizedBox(height: 10),
            
                              buildLabels('Teams'),
                                
                              comic.teams == null || comic.teams!.isEmpty 
                                ? const NoDataWidget()
                                : GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: comic.teams!.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                      mainAxisExtent: 50
                                  ), 
                                  itemBuilder: (context, index) {
                                    var item = comic.teams![index];
                                
                                    return TextButton.icon(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          alignment: Alignment.centerLeft,
                                          foregroundColor: AppTheme.primaryColor
                                        ), 
                                        icon: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: AppTheme.primaryColor,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: const Icon(Icons.groups, color: Colors.white54, size: 24),
                                        ), 
                                        label: Text(item['name'])
                                      );
                                  },
                                ),
                                
                              const SizedBox(height: 10),

                              buildLabels('Locations'),
                                
                              comic.locations == null || comic.locations!.isEmpty 
                                ? const NoDataWidget()
                                : GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: comic.locations!.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 50
                                  ), 
                                  itemBuilder: (context, index) {
                                    var item = comic.locations![index];
                                
                                    return TextButton.icon(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          alignment: Alignment.centerLeft,
                                          foregroundColor: AppTheme.primaryColor
                                        ), 
                                        icon: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: AppTheme.primaryColor,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: const Icon(Icons.map_rounded, color: Colors.white54, size: 24),
                                        ), 
                                        label: Text(item['name'])
                                      );
                                  },
                                ),

                              const SizedBox(height: 10),

                              buildLabels('Concepts'),
                                
                              comic.concepts == null || comic.concepts!.isEmpty 
                                ? const NoDataWidget()
                                : GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: comic.concepts!.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 50
                                  ), 
                                  itemBuilder: (context, index) {
                                    var item = comic.concepts![index];
                                
                                    return TextButton.icon(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          alignment: Alignment.centerLeft,
                                          foregroundColor: AppTheme.primaryColor
                                        ), 
                                        icon: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: AppTheme.primaryColor,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: const Icon(Icons.lightbulb, color: Colors.white54, size: 24),
                                        ), 
                                        label: Text(item['name'])
                                      );
                                  },
                                ),      
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
              ),
            );
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                
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
            
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                      image: comic.imageURL != null 
                        ? DecorationImage(image: NetworkImage(comic.imageURL!))
                        : null
                    ),
                  ),

                  const SizedBox(height: 40),

                  Column(
                    children: [
                      buildLabels('Characters'),
  
                      comic.characters == null || comic.characters!.isEmpty 
                        ? const NoDataWidget()
                        : GridView.builder(
                          shrinkWrap: true,
                          itemCount: comic.characters!.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            mainAxisExtent: 50
                          ), 
                          itemBuilder: (context, index) {
                            var item = comic.characters![index];
                        
                            return TextButton.icon(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                foregroundColor: AppTheme.primaryColor
                              ), 
                              icon: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: const Icon(Icons.person, color: Colors.white54, size: 24),
                              ), 
                              label: Text(item['name'])
                            );
                          },
                        ),

                    const SizedBox(height: 10),
  
                    buildLabels('Teams'),
                      
                    comic.teams == null || comic.teams!.isEmpty 
                      ? const NoDataWidget()
                      : GridView.builder(
                        shrinkWrap: true,
                        itemCount: comic.teams!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                            mainAxisExtent: 50
                        ), 
                        itemBuilder: (context, index) {
                          var item = comic.teams![index];
                      
                          return TextButton.icon(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                foregroundColor: AppTheme.primaryColor
                              ), 
                              icon: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: const Icon(Icons.groups, color: Colors.white54, size: 24),
                              ), 
                              label: Text(item['name'])
                            );
                        },
                      ),
                      
                    const SizedBox(height: 10),

                    buildLabels('Locations'),
                      
                    comic.locations == null || comic.locations!.isEmpty 
                      ? const NoDataWidget()
                      : GridView.builder(
                        shrinkWrap: true,
                        itemCount: comic.locations!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 50
                        ), 
                        itemBuilder: (context, index) {
                          var item = comic.locations![index];
                      
                          return TextButton.icon(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                foregroundColor: AppTheme.primaryColor
                              ), 
                              icon: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: const Icon(Icons.map_rounded, color: Colors.white54, size: 24),
                              ), 
                              label: Text(item['name'])
                            );
                        },
                      ),

                    const SizedBox(height: 10),

                    buildLabels('Concepts'),
                      
                    comic.concepts == null || comic.concepts!.isEmpty 
                      ? const NoDataWidget()
                      : GridView.builder(
                        shrinkWrap: true,
                        itemCount: comic.concepts!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 50
                        ), 
                        itemBuilder: (context, index) {
                          var item = comic.concepts![index];
                      
                          return TextButton.icon(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                foregroundColor: AppTheme.primaryColor
                              ), 
                              icon: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: const Icon(Icons.lightbulb, color: Colors.white54, size: 24),
                              ), 
                              label: Text(item['name'])
                            );
                        },
                      ),      
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildLabels(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, 
          style: const TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold
          )
        ),
        const Flexible(child: Divider()), 
      ],
    );
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      child: const Text('No data', 
        style: TextStyle(fontSize: 20, color: Colors.black54)),  
    );
  }
}