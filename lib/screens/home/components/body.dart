import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/products_all.dart';
import 'package:shop_app/screens/home/components/section_title_only.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            // SizedBox(height: getProportionateScreenWidth(10)),
            // DiscountBanner(),
            Categories(),
            // SpecialOffers(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child:
                  SectionTitleOnly(title: "Products Subscribed", press: () {}),
            ),
            AllProducts(),
            // SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
