// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:food_delivery_app/widgets/counter_widget.dart';
import 'package:food_delivery_app/widgets/product_specs_item.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    super.key,
  });


  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  
  @override
  Widget build(BuildContext context) {
       final product=ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if(favProducts.contains(product)){
                  favProducts.remove(product);

                }
                else{
                  favProducts.add(product);
                }
              });
            },
            icon:  Icon(
              favProducts.contains(product)
              ? Icons.favorite 
              :Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: const BoxDecoration(color: AppColor.greyWhite),
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image.network(
                    product.imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            product.category.title,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const CounterWidget(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        ProductSpecsItem(title: 'Size', value: 'Large'),
                        SizedBox(
                          height: 30,
                          child: VerticalDivider(),
                        ),
                        ProductSpecsItem(title: 'Calories', value: '120 cal'),
                        SizedBox(
                          height: 30,
                          child: VerticalDivider(),
                        ),
                        ProductSpecsItem(title: 'Cooking', value: '10 mins'),
                      ],
                  ),
                   const SizedBox(height: 16),
                    Text(
                    product.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColor.grey,
                          ),
                    ),
                    const SizedBox( height :24),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                         Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: AppColor.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text('Add to cart'),
                            ),
                          ),
                         ),
                      

                      ],
                      ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
