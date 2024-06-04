import 'package:flutter/material.dart';
import 'package:news_app/pages/Home/widget/category_item.dart';
import 'package:news_app/pages/Home/widget/news_details_view.dart';
import '../../models/category_mode.dart';
import '../search/search_screen.dart';
import 'widget/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [

    CategoryModel(
      CategoryId: "sports",
      CategoryTitle: "Sports",
      CategoryImage: "assets/sports.png",
      CategoryColor: const Color(0xFFC91C22),
    ),

    CategoryModel(
      CategoryId: "general",
      CategoryTitle: "Politics",
      CategoryImage: "assets/Politics.png",
      CategoryColor: const Color(0xFF003E90),
    ),

    CategoryModel(
      CategoryId: "health",
      CategoryTitle: "Health",
      CategoryImage: "assets/health.png",
      CategoryColor: const Color(0xFFED1E79),
    ),

    CategoryModel(
      CategoryId: "business",
      CategoryTitle: "Business ",
      CategoryImage: "assets/bussines.png",
      CategoryColor: const Color(0xFFCF7E48),
    ),

    CategoryModel(
      CategoryId: "environment",
      CategoryTitle: "Environment",
      CategoryImage: "assets/environment.png",
      CategoryColor: const Color(0xFF4882CF),
    ),

    CategoryModel(
      CategoryId: "science",
      CategoryTitle: "Science",
      CategoryImage: "assets/science.png",
      CategoryColor: const Color(0xFFF2D352),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/pattern.png"),

          fit: BoxFit.cover,
        ),
        color: Colors.white,
      ),

      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,

        appBar: AppBar(
          title: Text(selectedCategory == null ? "News App" :
          selectedCategory!.CategoryTitle,

          ),
          actions: [
            IconButton(onPressed: () {
              showSearch(context: context, delegate: Search());
            },
                icon: Icon(Icons.search)
            )
          ],
        ),

        body: selectedCategory == null
            ? Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text("Pick your category \n of interest",
                  style: theme.textTheme.titleLarge!.copyWith(
                      color: const Color(0xFF4F5A69)
                  )
              ),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(15),

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 9 / 10.5,
                  ),

                  itemBuilder: (context, index) =>
                      CategoryItem(

                        categoryModel: categories[index],
                        index: index,

                        onItemClick: onCategoryItemClick,

                      ),
                  itemCount: categories.length,

                ),
              )


            ],
          ),
        )

            : NewsDetailsView(categoryModel: selectedCategory!),

        drawer: const CustomDrawer(),


      ),
    );
  }

  CategoryModel ? selectedCategory;

  onCategoryItemClick(CategoryModel categoryModel) {
    print(categoryModel.CategoryId);
    selectedCategory = categoryModel;
    setState(() {

    });
  }
}
