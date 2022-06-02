import 'package:clothing_store_app_ui/components/product_item.dart';
import 'package:clothing_store_app_ui/models/categories.dart';
import 'package:clothing_store_app_ui/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import './components/constants.dart';
import 'components/discover-circle.dart';
import 'models/app.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    "images/1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    List<Category> categories = MockedDataCategories.data;
    return Scaffold(
      backgroundColor: App.themeColor,

      // Navigation bar Container
      appBar: AppBar(
        elevation: 0,
        backgroundColor: App.themeColor,

        // Menu button
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: App.mainColor,
          ),
          onPressed: () {},
        ),

        // Shopping list button
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              height: 30,
              width: 30,
              child: PhysicalShape(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 2,
                clipper: ShapeBorderClipper(
                  shape: CircleBorder(),
                ),
                child: Icon(
                  Icons.shopping_bag_rounded,
                  color: App.mainColor,
                ),
              ),
            ),
          ),
        ],
      ),

      // Product grid views
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // Top components
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: BoxSpace.paddingDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Heading Title
                Column(
                  children: [
                    Text(
                      "Discover",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),

                // Sort Button
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, primary: App.mainColor),
                  child: Row(
                    children: [
                      Text(
                        "Shot by",
                        style: TextStyle(
                          color: App.mainColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: App.mainColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Subheading Title
          Padding(
            padding: const EdgeInsets.only(left: BoxSpace.paddingDefault),
            child: Text(
              "Explore Our Collections",
              style: TextStyle(color: ColorPalette.darkColor),
            ),
          ),

          // ***
          // Product Categories
          // ***
          Container(
            height: 120,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => DisCoverCircle(
                  image: categories[index].image,
                  title: categories[index].name),
            ),
          ),

          // ***
          // Search Box
          // ***
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: BoxSpace.paddingDefault),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(BoxSpace.paddingSmall),
                prefixIcon: Icon(
                  Icons.search,
                  color: App.mainColor,
                ),
                hintText: "Search for products",
                hintStyle: TextStyle(
                  color: App.mainColor,
                ),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: Container(
                  padding: EdgeInsets.all(8.0),
                  child: PhysicalShape(
                    color: App.mainColor,
                    shadowColor: Colors.black,
                    elevation: 2,
                    clipper: ShapeBorderClipper(
                      shape: CircleBorder(),
                    ),
                    child: Icon(
                      Icons.sync_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // ***
          // Product Items
          // ***
          Padding(
            padding: const EdgeInsets.all(BoxSpace.paddingDefault),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: categories[0].products.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) =>
                  ProductItems(products: categories[0].products[index]),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
