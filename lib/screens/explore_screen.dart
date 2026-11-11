import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../data/attractions_data.dart';
import '../widgets/attraction_card.dart';
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          color: AppColors.primary,

          padding:
          const EdgeInsets.all(15),

          child: TextField(
            decoration: InputDecoration(
              hintText:
              "Search attractions",

              prefixIcon:
              const Icon(Icons.search),

              filled: true,

              fillColor: Colors.white,

              border:
              OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(
                    30),

                borderSide:
                BorderSide.none,
              ),
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount:
            attractions.length,

            itemBuilder:
                (context, index) {

              return AttractionCard(
                attraction:
                attractions[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
