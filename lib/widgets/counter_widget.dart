import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_color.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: AppColor.greyWhite, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (counter > 1) {
                        counter--;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove)),
              Text(
                counter.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 8),
              IconButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                 icon:const Icon(Icons.add)),
            ],
          ),
          
        ));
  }
}
