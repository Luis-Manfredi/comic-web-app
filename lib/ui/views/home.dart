import 'package:flutter/material.dart';

import '../../data/local/demo_list.dart';
import '../../domain/entities/comic_entity.dart';
import '../utils/app_theme.dart';
import '../widgets/custom_grid_tile.dart';
import '../widgets/custom_list_tile.dart';
import 'comic_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = true;
  List<ComicEntity> comics = Demo.demoList;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return buildDesktopView();
          } else if (constraints.maxWidth > 600) {
            return buildTabletView();
          } else {
            return buildPhoneView();
          }
        },
      ),
    );
  }

  // Desktop View
  Widget buildDesktopView() {
    return SingleChildScrollView(
      controller: _controller,
      child: Center(
        child: SizedBox(
          width: 800,
          child: Column(
            children: [
              const SizedBox(height: 40),
                
              const Text('ComicBook', style: TextStyle(fontSize: 42)),
        
              const Divider(),
        
              // Control layout buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Latest Issues', style: TextStyle(fontWeight: FontWeight.bold)),
        
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            isGrid = false;
                          });
                        }, 
                        style: TextButton.styleFrom(
                          foregroundColor: isGrid == false 
                            ? AppTheme.primaryColor
                            : Colors.black
                        ), 
                        icon: const Icon(Icons.list_rounded),
                        label: const Text('List', 
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            isGrid = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: isGrid == true 
                            ? AppTheme.primaryColor
                            : Colors.black
                        ), 
                        icon: const Icon(Icons.view_compact_rounded),
                        label: const Text('Grid', 
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
        
              const Divider(),
        
              const SizedBox(height: 40),
        
              // Change to Grid layout if isGrid is true otherwise set view to List
              if (isGrid) ... [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 380
                  ), 
                  itemCount: comics.length,
                  itemBuilder: (context, index) {
                    var item = comics[index];
                
                    return CustomGridTile(
                      item: item, 
                      onTap: () => Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => ComicDetails(comic: item)
                        )
                      )
                    );
                  },
                )
              ] else ... [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = comics[index];

                    return CustomListTile(
                      item: item, 
                      onTap: () => Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => ComicDetails(comic: item)
                        )
                      )
                    );
                  }, 
                  separatorBuilder: (context, index) => const Divider(), 
                  itemCount: comics.length
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  // Tablet View
  Widget buildTabletView() {
    return SingleChildScrollView(
      controller: _controller,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 40),
  
          const Text('ComicBook', style: TextStyle(fontSize: 42)),
    
          const Divider(),
    
          // Control layout buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Latest Issues', style: TextStyle(fontWeight: FontWeight.bold)),
    
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        isGrid = false;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: isGrid == false 
                        ? AppTheme.primaryColor
                        : Colors.black
                    ),  
                    icon: const Icon(Icons.list),
                    label: const Text('List'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        isGrid = true;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: isGrid == true 
                        ? AppTheme.primaryColor
                        : Colors.black
                    ),  
                    icon: const Icon(Icons.grid_view),
                    label: const Text('Grid'),
                  ),
                ],
              )
            ],
          ),
    
          const Divider(),
    
          const SizedBox(height: 40),
    
          // Change to Grid layout if isGrid is true otherwise set view to List
          if (isGrid) ... [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                mainAxisExtent: 380
              ), 
              itemCount: comics.length,
              itemBuilder: (context, index) {
                var item = comics[index];
            
                return CustomGridTile(
                  item: item, 
                  onTap: () => Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => ComicDetails(comic: item)
                    )
                  )
                );
              },
            )
          ] else ... [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = comics[index];

                return CustomListTile(
                  item: item, 
                  onTap: () => Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => ComicDetails(comic: item)
                    )
                  )
                );
              }, 
              separatorBuilder: (context, index) => const Divider(), 
              itemCount: comics.length
            )
          ]
        ],
      ),
    );
  }

  // Phone View
  Widget buildPhoneView() {
    return SingleChildScrollView(
      controller: _controller,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 40),
  
          const Text('ComicBook', style: TextStyle(fontSize: 42)),
    
          const Divider(),
    
          // Control layout buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Latest Issues', style: TextStyle(fontWeight: FontWeight.bold)),
    
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.list),
                    label: const Text('List'),
                  ),
                  TextButton.icon(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      foregroundColor: isGrid == true 
                        ? AppTheme.primaryColor
                        : Colors.black
                    ),  
                    icon: const Icon(Icons.grid_view),
                    label: const Text('Grid'),
                  ),
                ],
              )
            ],
          ),
    
          const Divider(),
    
          const SizedBox(height: 40),
    
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = comics[index];

              return CustomListTile(
                item: item, 
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => ComicDetails(comic: item)
                  )
                )
              );
            }, 
            separatorBuilder: (context, index) => const Divider(), 
            itemCount: comics.length
          )
        ],
      ),
    );
  }
}