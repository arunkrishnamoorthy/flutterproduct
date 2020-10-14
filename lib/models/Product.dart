import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description, category, subcategory, categoryImage;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
    this.category,
    this.subcategory,
    this.categoryImage,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 20,
    images: [
      "assets/images/ps4_console_white_3.png",
      "assets/images/dymo.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Dymo",
    price: 64.99,
    description: dymoDescription,
    rating: 4.8,
    category: "Writing",
    subcategory: "dymo",
    categoryImage: "assets/images/dymo.png",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 30,
    images: [
      "assets/images/Elmers1.png",
      "assets/images/Elmers1.png",
      "assets/images/Elmers1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Elmer's",
    price: 75.99,
    description: elmersDescription,
    rating: 4.8,
    category: "Writing",
    subcategory: "elmers",
    categoryImage: "assets/images/color-elmers.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 40,
    images: [
      "assets/images/MrSktech1.png",
      "assets/images/MrSktech2.png",
      "assets/images/MrSktech3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Mr. Sketch",
    price: 75.99,
    description: mrsketchDescription,
    rating: 4.8,
    category: "Writing",
    subcategory: "mr-sketch",
    categoryImage: "assets/images/color-mrsketch.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 50,
    images: [
      "assets/images/Reynolds1.png",
      "assets/images/Reynolds2.png",
      "assets/images/Reynolds3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Reynolds",
    price: 75.99,
    description: reynoldsDescription,
    rating: 4.8,
    category: "Writing",
    subcategory: "reynolds-pens",
    categoryImage: "assets/images/color-reynolds.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 60,
    images: [
      "assets/images/Aprica1.png",
      "assets/images/Aprica2.png",
      "assets/images/Aprica3.png",
      "assets/images/Aprica4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Reynolds",
    price: 75.99,
    description: apricaDescription,
    rating: 4.8,
    category: "Baby",
    subcategory: "Aprica",
    categoryImage: "assets/images/color-aprica.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 70,
    images: [
      "assets/images/BabyJogger1.png",
      "assets/images/BabyJogger2.png",
      "assets/images/BabyJogger3.png",
      "assets/images/BabyJogger4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Baby Jogger",
    price: 75.99,
    description: babyjoggerDescription,
    rating: 4.8,
    category: "Baby",
    subcategory: "baby-jogger",
    categoryImage: "assets/images/color-babyjogger.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 80,
    images: [
      "assets/images/Nuk1.png",
      "assets/images/Nuk2.png",
      "assets/images/Nuk3.png",
      "assets/images/Nuk4.png",
      "assets/images/Nuk5.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "NUK",
    price: 75.99,
    description: nukDescription,
    rating: 4.8,
    category: "Baby",
    subcategory: "nuk",
    categoryImage: "assets/images/color-nuk.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 90,
    images: [
      "assets/images/Aerobed1.png",
      "assets/images/Aerobed1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "aerobed",
    price: 75.99,
    description: aerobedDescription,
    rating: 4.8,
    category: "Outdoor & Recreation",
    subcategory: "aerobed",
    categoryImage: "assets/images/color-aero.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 100,
    images: [
      "assets/images/Stearns1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Stearns",
    price: 75.99,
    description: stearnsDescription,
    rating: 4.8,
    category: "Outdoor & Recreation",
    subcategory: "stearns",
    categoryImage: "assets/images/color-stearns.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 100,
    images: [
      "assets/images/ChesapeakeBayCandle1.png",
      "assets/images/ChesapeakeBayCandle2.png",
      "assets/images/ChesapeakeBayCandle3.png",
      "assets/images/ChesapeakeBayCandle4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Chesapeake Bay Candle",
    price: 75.99,
    description: cheDescription,
    rating: 4.8,
    category: "Home Fragrance--",
    subcategory: "Chesapeake Bay Candle",
    categoryImage: "assets/images/color-chesepeake.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 110,
    images: [
      "assets/images/woodwick1.png",
      "assets/images/woodwick2.png",
      "assets/images/woodwick3.png",
      "assets/images/woodwick4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "WoodWick",
    price: 75.99,
    description: woodwickDescription,
    rating: 4.8,
    category: "Home Fragrance",
    subcategory: "WoodWick",
    categoryImage: "assets/images/woodwick.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 120,
    images: [
      "assets/images/BRK1.png",
      "assets/images/BRK2.png",
      "assets/images/BRK3.png",
      "assets/images/BRk4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "BRK",
    price: 75.99,
    description: BRKDescription,
    rating: 4.8,
    category: "Connected Home & Security",
    subcategory: "BRK",
    categoryImage: "assets/images/color-brk.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 130,
    images: [
      "assets/images/FirstAlert1.png",
      "assets/images/FirstAlert2.png",
      "assets/images/FirstAlert3.png",
      "assets/images/FirstAlert4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "First Alert",
    price: 75.99,
    description: FirstAlertDescription,
    rating: 4.8,
    category: "Connected Home & Security",
    subcategory: "First Alert",
    categoryImage: "assets/images/firstalert-color.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 140,
    images: [
      "assets/images/Calphalon1.png",
      "assets/images/Calphalon2.png",
      "assets/images/Calphalon3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Calphalon",
    price: 75.99,
    description: CalphalonDescription,
    rating: 4.8,
    category: "Appliances & Cookware",
    subcategory: "Calphalon",
    categoryImage: "assets/images/color-calphalon.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 150,
    images: [
      "assets/images/Mrcoffee.png",
      "assets/images/Mrcoffee2.png",
      "assets/images/Mrcoffee3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Mr. Coffee",
    price: 75.99,
    description: MrcoffeeDescription,
    rating: 4.8,
    category: "Appliances & Cookware",
    subcategory: "Mr. Coffee",
    categoryImage: "assets/images/color-mrcoffee.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 160,
    images: [
      "assets/images/Sunbeam1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Sunbeam",
    price: 75.99,
    description: SunbeamDescription,
    rating: 4.8,
    category: "Appliances & Cookware",
    subcategory: "Sunbeam",
    categoryImage: "assets/images/color-sunbeam.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 170,
    images: [
      "assets/images/FodSaver1.png",
      "assets/images/FodSaver2.png",
      "assets/images/FodSaver3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "FoodSaver",
    price: 75.99,
    description: FoodsaverDescription,
    rating: 4.8,
    category: "Food",
    subcategory: "FoodSaver",
    categoryImage: "assets/images/color-foodsaver.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 180,
    images: [
      "assets/images/Rubbermaid1.png",
      "assets/images/Rubbermaid2.png",
      "assets/images/Rubbermaid3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Rubbermaid",
    price: 75.99,
    description: RubbermaidDescription,
    rating: 4.8,
    category: "Food",
    subcategory: "Rubbermaid",
    categoryImage: "assets/images/color-rubbermaid.svg",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 190,
    images: [
      "assets/images/Bernardin1.png",
      "assets/images/Bernardin2.png",
      "assets/images/Bernardin3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Bernardin",
    price: 75.99,
    description: BernardinDescription,
    rating: 4.8,
    category: "Food",
    subcategory: "Bernardin",
    categoryImage: "assets/images/color-Bernardin.svg",
    isFavourite: true,
    isPopular: true,
  )
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
const String dymoDescription =
    "From simple embossers and manual label makers to industrial portables, cutting-edge software and online services, DYMO helps simplify your tasks while ensuring a professional look and feel. DYMO, part of Newell Brands' strong portfolio of well-known brands, is committed to making everyday jobs easier through innovative technology solutions";
const String elmersDescription =
    "By continuing to develop innovative new products, Elmer's has become the trusted brand when it comes to fueling creativity and providing outstanding product performance in the classroom, at home, in the workshop and at the craft table. Elmer's inspires people to create, build and learn for life.";
const String mrsketchDescription =
    "Recently introduced themed packs include Movie Night with scents such as Buttery Popcorn and Nacho Cheese, Ice Cream scented markers featuring Mint Chocolate Chip and a Holiday pack, with Sugar Cookie and Candy Cane scents. Mr. Sketch scented markers are available as both washable and non-washable markers with two tip sizes, which are great for drawing thick or thin lines and are perfect for sparking young artists’ imagination. Mr. Sketch is safe for children over 3 years of age.";
const String reynoldsDescription =
    "Today, Reynolds is one of the most well-known brands in the Indian market with more than 80% brand awareness and carries various product ranges, including TRIMAX, the most recent relaunch with the new benefits of MAX smoothness, MAX precision and MAX write length.";
const String apricaDescription =
    "We've come to understand that babies are happiest when they are integrated into their parents' lives in a meaningful way. That's why everything we do makes it easier for you to share the world with your baby. So you're ready to get out of the house. Ready to introduce your baby to new things. Ready to experience all the excitement that comes with having a baby. Ready for parenthood.";
const String babyjoggerDescription =
    "Baby Jogger's innovation has been recognized all over the world, winning more than 20 design and innovation awards in the past four years alone. Baby Jogger is a global brand sold in more than 70 countries.";
const String nukDescription =
    "By combining years of expertise and trust, we are committed to nurturing your children's healthy transitions from birth to toddler. We have worked for over 50 years to design the highest quality products that are innovative and scientifically-proven to support safe and healthy development. Backed by a dedicated team of experts, our products are designed to combine science with style while maintaining the highest quality. Our products don't just meet international safety standards, they exceed them. And we listen to the real world experts – parents just like you – to meet and exceed your needs.";
const String aerobedDescription =
    "We are the leading innovator of premium, stylish, technologically-advanced airbeds. We continually strive to provide unique, quality products that deliver superior convenience, comfort, durability, and style both indoors and outdoors.";
const String stearnsDescription =
    "William P. Hilger started what would become Stearns, Inc. among the lakes and plains of central Minnesota. The company offers flotation devices, towables, rainwear, waders, and gear for hunting and fishing, along with industrial equipment built for the harshest conditions.";
const String cheDescription =
    "Chesapeake Bay Candle® was founded in early 1994 by Mei Xu and David Wang. The then-husband-and-wife team started out by hand-making candles in the basement of their home in Annapolis, Maryland. Mesmerized and inspired by the beauty of the Chesapeake Bay shoreline near their home, they decided to pay tribute and named their brand Chesapeake Bay Candle. From day one, Chesapeake Bay Candle has celebrated a natural way of living with the use of botanical inspired fragrances and clean, minimalist designs. With the introduction of the Chesapeake Bay Mind and Body Collection in 2016, Chesapeake Bay Candle has evolved into a wellness lifestyle brand. An artfully curated line of home fragrances infused with all natural essential oils, Chesapeake Bay Mind & Body was created to allow you to rediscover your inner joy, peace and tranquility.";
const String woodwickDescription =
    "WoodWick® combines sophisticated fragrances and elegant designs to create a multi-sensory experience that exceeds expectations in every sense.";
const String BRKDescription =
    "Our products are designed to save lives. It's a responsibility we don't take lightly. We build each smoke alarm, carbon monoxide alarm, heat alarm and fire extinguisher to the highest standards. Our brands include BRK®, First Alert®, Family Gard®, Tundra® and Onelink®.";
const String FirstAlertDescription =
    "Our products offer a sense of preparedness and assurance that enable a higher quality of life. Furthermore, First Alert takes great pride in community involvement including a longstanding, extensive outreach to fire service throughout the nation. We support countless organizations to assist in raising awareness in fire prevention, carbon monoxide and overall safety.";
const String CalphalonDescription =
    "Calphalon is a leading manufacturer of professional quality cookware, cutlery, bakeware and accessories for the home chef. Calphalon began by selling cookware to restaurants and commercial kitchens.";
const String MrcoffeeDescription =
    "Today, the Mr. Coffee brand brings the coffee house to your counter-top with innovations that offer at-home brewing including the Mr. Coffee Café Latte and the Mr. Coffee Café Frappe. Designing to the trends and tastes of the coffee-drinking population, the Mr. Coffee brand continually reinvents its coffeemakers to deliver the best technology for a great price.";
const String SunbeamDescription =
    "For over 100 years, Sunbeam has been simplifying the lives of everyday people. Today, our commitment to simple, sophisticated and elegant design has remained unchanged. Our products don't just look smart, they are smart.";
const String BallDescription =
    "Experienced cooks, home chefs, bulk shoppers and outdoor enthusiasts trust FoodSaver Branded appliances with their best ingredients to keep food fresh up to 5 times longer than traditional storage methods. FoodSaver Brand Products have been America's #1 Selling Brand of Home Vacuum Packaging Systems for more than 20 years and has helped millions of households keep food fresh longer in the refrigerator, freezer and pantry.";
const String FoodsaverDescription =
    "Experienced cooks, home chefs, bulk shoppers and outdoor enthusiasts trust FoodSaver Branded appliances with their best ingredients to keep food fresh up to 5 times longer than traditional storage methods. FoodSaver Brand Products have been America's #1 Selling Brand of Home Vacuum Packaging Systems for more than 20 years and has helped millions of households keep food fresh longer in the refrigerator, freezer and pantry.";
const String RubbermaidDescription =
    "Widely recognized and trusted, Rubbermaid designs and markets a full range of organization, storage and cleaning products to keep the home – including closets, garages, kitchens and outdoor spaces – neat and functional, freeing consumers to enjoy life.";
const String BernardinDescription =
    "For 100 years, home canning has been a primary focus for Bernardin Ltd. Home canning has always been the best way to preserve the natural goodness of our foods. Today home canning is even more attractive to Canadians because of their growing concern and interest in knowing the source of the food we eat. At Bernardin, our goal is to provide you with the tools and expertise you’ll need to bring nature’s bounty to your table all year long. In dedicated laboratories, Bernardin specialists subject all its products and recipes to rigorous testing. From Mason jar design and thermal shock resistance, to sealing compounds and pectin performance, every safety aspect is investigated and monitored.";
