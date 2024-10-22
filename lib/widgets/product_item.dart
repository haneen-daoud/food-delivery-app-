import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product.dart';
import 'package:food_delivery_app/utils/app_color.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: Image.network(
                  widget.product.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                widget.product.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '\$${widget.product.price}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Positioned(
            top: 4,
            right: 4,
            child: InkWell(
              onTap: () {
                setState(() {
                  if (favProducts.contains(widget.product)) {
                    favProducts.remove(widget.product);
                  } else {
                    favProducts.add(widget.product);
                  }
                });
              },
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white,
                  ),
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      favProducts.contains(widget.product)
                      ?Icons.favorite
                      :Icons.favorite_border,
                    
                        color: Theme.of(context).primaryColor,
                      ),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
