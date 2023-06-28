import 'package:flutter/material.dart';

// import '../../data/local/demo_list.dart';
import '../../data/remote/api_remote.dart';
import '../../data/repository/comics_repo_impl.dart';
import '../../domain/entities/comic_entity.dart';
import '../../domain/usecases/get_comics_list.dart';
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
  // List<ComicEntity> comics = Demo.demoList;
  final _controller = ScrollController();
  List<ComicEntity> comics = [];

  Future setComicsList() async {
    comics = await APIRemoteImplementation().getComics();
  }

  @override
  void initState() {
    super.initState();
    // setup comics list
    setComicsList();
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

              StreamBuilder(
                // Execute usecase
                stream: Stream.fromFuture(GetComicsList(ComicsListRepoImplementation(APIRemoteImplementation())).execute()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return isGrid 
                      ? GridView.builder(
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
                              onTap: () async {
                                showDialog(
                                  context: context, 
                                  builder: (context) => const Center(
                                    child: CircularProgressIndicator(
                                      color: AppTheme.primaryColor
                                    )
                                  )
                                );

                                var comic = await APIRemoteImplementation().getComicDetails(item.detailsURL);

                                if (mounted) {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context, MaterialPageRoute(
                                      builder: (context) => ComicDetails(comic: comic)
                                    )
                                  );
                                }  
                              }
                            );
                          },
                        )
                  : ListView.separated(
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
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('No Data. Load Again.', style: TextStyle(fontSize: 24, color: Colors.black54)),
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        const CircularProgressIndicator(color: AppTheme.primaryColor)
                      ],
                    );
                  }
                }
              ),              
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
    
          
          StreamBuilder(
            // Execute usecase
            stream: Stream.fromFuture(GetComicsList(ComicsListRepoImplementation(APIRemoteImplementation())).execute()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return isGrid 
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 0,
                        mainAxisExtent: 380
                      ), 
                      itemCount: comics.length,
                      itemBuilder: (context, index) {
                        var item = comics[index];
                    
                        return CustomGridTile(
                          item: item, 
                          onTap: () async {
                            showDialog(
                              context: context, 
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(
                                  color: AppTheme.primaryColor
                                )
                              )
                            );

                            var comic = await APIRemoteImplementation().getComicDetails(item.detailsURL);

                            if (mounted) {
                              Navigator.pop(context);
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => ComicDetails(comic: comic)
                                )
                              );
                            }  
                          }
                        );
                      },
                    )
              : ListView.separated(
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
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('No Data. Load Again.', style: TextStyle(fontSize: 24, color: Colors.black54)),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    const CircularProgressIndicator(color: AppTheme.primaryColor)
                  ],
                );
              }
            }
          ),
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
    
          StreamBuilder(
            // Execute usecase
            stream: Stream.fromFuture(GetComicsList(ComicsListRepoImplementation(APIRemoteImplementation())).execute()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
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
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('No Data. Load Again.', style: TextStyle(fontSize: 24, color: Colors.black54)),
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    const CircularProgressIndicator(color: AppTheme.primaryColor)
                  ],
                );
              }
            }
          )
        ],
      ),
    );
  }
}