import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

String selectedCategorie = "Writing";

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
// class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "All",
      "Writing",
      "Baby",
      "Appliances",
      "Commercials"
    ];
    // List<Map<String, dynamic>> categories = [
    //   {"icon": "assets/icons/Flash Icon.svg", "text": "Writing"},
    //   {"icon": "assets/icons/Bill Icon.svg", "text": "Appliance"},
    //   {"icon": "assets/icons/Game Icon.svg", "text": "Security"},
    //   {"icon": "assets/icons/Gift Icon.svg", "text": "Cookware"},
    //   {"icon": "assets/icons/Discover.svg", "text": "More"},
    // ];
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Container(
          height: 50,
          child: ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategorieTile(
                  categorie: categories[index],
                  isSelected: selectedCategorie == categories[index],
                  context: this,
                );
              }),
        ));
  }
}

class CategorieTile extends StatefulWidget {
  final String categorie;
  final bool isSelected;
  _CategoriesState context;
  CategorieTile({this.categorie, this.isSelected, this.context});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.context.setState(() {
          selectedCategorie = widget.categorie;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
            color: widget.isSelected ? kPrimaryColor : Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          widget.categorie,
          style: TextStyle(
              color: widget.isSelected ? Colors.white : Color(0xffA1A1A1)),
        ),
      ),
    );
  }
}

// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
//     Key key,
//     @required this.icon,
//     @required this.text,
//     @required this.press,
//   }) : super(key: key);

//   final String icon, text;
//   final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         widget.context.setState(() {
//           selectedCategorie = widget.categorie;
//         });
//       },
//       child: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         margin: EdgeInsets.only(left: 8),
//         height: 30,
//         decoration: BoxDecoration(
//             color: widget.isSelected ? Color(0xffFFD0AA) : Colors.white,
//             borderRadius: BorderRadius.circular(30)),
//         child: Text(
//           widget.categorie,
//           style: TextStyle(
//               color: widget.isSelected ? Color(0xffFC9535) : Color(0xffA1A1A1)),
//         ),
//       ),
//     );
//     // return GestureDetector(
//     //   onTap: press,
//     //   child: SizedBox(
//     //     // width: getProportionateScreenWidth(55),
//     //     child: Column(
//     //       children: [
//     //         // Container(
//     //         //   padding: EdgeInsets.all(getProportionateScreenWidth(15)),
//     //         //   // height: getProportionateScreenWidth(25),
//     //         //   // width: getProportionateScreenWidth(25),
//     //         //   decoration: BoxDecoration(
//     //         //     color: Color(0xFFFFECDF),
//     //         //     borderRadius: BorderRadius.circular(10),
//     //         //   ),
//     //         //   child: SvgPicture.asset(icon),
//     //         // ),
//     //         // SizedBox(height: 5),
//     //         Text(text)
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
