import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/widgets/product_item.dart';
import '../models/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List <Product> filterProducts;
  String? selectedCategoryId = '';

@override
void initState(){
  super.initState();
  filterProducts=dummyProducts;
}

  @override
  Widget build(BuildContext context) {
    final orientation =MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/delicious-food-banner-template-design-cd3994e39458960f4f33e73b8c60edb9_screen.jpg?ts=1645769305',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Find your food!',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
  height: 100,
  child: ListView.builder(
    itemCount: Category.dummyCategories.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      final dummyCategory = Category.dummyCategories[index];
      return InkWell(
        onTap: () {
          setState(() {
            if (selectedCategoryId == dummyCategory.id && selectedCategoryId!=null) {
              selectedCategoryId = null;
              filterProducts = dummyProducts;
            } else {
              selectedCategoryId = dummyCategory.id;
              filterProducts = dummyProducts.where((product) =>
                  product.category.id == selectedCategoryId).toList();
            }
          });
        },
        child: Card(
          color: selectedCategoryId == dummyCategory.id
              ? Theme.of(context).primaryColor
              : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  dummyCategory.imgUrl,
                  width: 50,
                  color: selectedCategoryId == dummyCategory.id
                      ? Colors.white
                      : null,
                ),
                const SizedBox(height: 5),
                Text(dummyCategory.title,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                            color: selectedCategoryId == dummyCategory.id
                                ? Colors.white
                                : null)),
              ],
            ),
          ),
        ),
      );
    },
  ),
),

            const SizedBox(height: 16),
            if(filterProducts.isNotEmpty)
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation==Orientation.portrait?2:4,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filterProducts.length,
              itemBuilder: (context, index) {
                final product = filterProducts[index];
                return InkWell(
                  onTap: ()=>Navigator.of(context).pushNamed(
                    '/product-details',
                  arguments: product,
                  ).then((value)=>setState((){})),

                child: ProductItem(product: product),
                  
                );
                
              },
            ),
            if(filterProducts.isEmpty) 
            const Center(
              child: Text('No products found '),
            )
          ],
        ),
      ),
    );
  }
}
  