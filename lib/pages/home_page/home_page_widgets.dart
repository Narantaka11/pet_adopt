import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../configuration.dart';
import '../../models/models.dart';
import '../details/details_page.dart';

class IconAnimalCategory extends StatelessWidget {
  const IconAnimalCategory({
    Key? key,
    required this.petCategory,
    required this.index,
  }) : super(key: key);

  final int petCategory;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: petCategory == index ? primaryGreen : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            categories[index]['iconPath'] as String,
            height: 50,
            width: 50,
            color: petCategory == index ? Colors.white : Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          categories[index]['name'] as String,
          style: const TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class PetDescription extends StatelessWidget {
  const PetDescription({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final categoryList =
        Provider.of<AnimalSelectedModel>(context).categoryList;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: shadowList,
                  ),
                  height: size.height * 0.27,
                ),
                Image.asset(
                  categoryList[index]['image'] as String,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadowList,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          categoryList[index]['name'] as String,
                          minFontSize: 18,
                          maxFontSize: 26,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        !(categoryList[index]['male'] as bool)
                            ? FontAwesomeIcons.mars
                            : FontAwesomeIcons.venus,
                        color: Colors.black54,
                      )
                    ],
                  ),
                  Text(
                    categoryList[index]['race'] as String,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    categoryList[index]['years'] as String,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.green),
                      const SizedBox(width: 2),
                      Expanded(
                        child: AutoSizeText(
                          categoryList[index]['distance'] as String,
                          minFontSize: 1,
                          maxFontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AnimalList extends StatelessWidget {
  const AnimalList({
    Key? key,
    required this.size,
    required this.isDrawerOpen,
    required this.petsLength,
  }) : super(key: key);

  final Size size;
  final bool isDrawerOpen;
  final int petsLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(isDrawerOpen ? 40.0 : 0),
        ),
      ),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          scrollDirection: Axis.vertical,
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.40,
          initialPage: 0,
        ),
        itemCount: petsLength,
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              Provider.of<AnimalSelectedModel>(context, listen: false).number =
                  index;
              Navigator.of(context).push(PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.decelerate,
                      ),
                    ),
                    child: const DetailsPage(),
                  );
                },
              ));
            },
            child: PetDescription(index: index),
          );
        },
      ),
    );
  }
}

class PerCategoryIconsButtons extends StatelessWidget {
  const PerCategoryIconsButtons({
    Key? key,
    required this.size,
    required this.petCategory,
  }) : super(key: key);

  final Size size;
  final int petCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: const Color(0xFFF6F6F6),
      child: ListView.separated(
        padding: const EdgeInsets.only(left: kPadding),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              final animalModel =
                  Provider.of<AnimalSelectedModel>(context, listen: false);
              Provider.of<AnimalCategoryBottomModel>(context, listen: false)
                  .number = index;

              switch (index) {
                case 0:
                  animalModel.petsLength = CatsList.length;
                  animalModel.categoryList = CatsList;
                  break;
                case 1:
                  animalModel.petsLength = DogsList.length;
                  animalModel.categoryList = DogsList;
                  break;
                case 2:
                  animalModel.petsLength = BunnyList.length;
                  animalModel.categoryList = BunnyList;
                  break;
                case 3:
                  animalModel.petsLength = BirdsList.length;
                  animalModel.categoryList = BirdsList;
                  break;
                case 4:
                  animalModel.petsLength = HorseList.length;
                  animalModel.categoryList = HorseList;
                  break;
              }
            },
            child: IconAnimalCategory(
              petCategory: petCategory,
              index: index,
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: kPadding),
      ),
    );
  }
}

class SearchBoxText extends StatelessWidget {
  const SearchBoxText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      height: 100,
      width: size.width,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const TextField(
        enabled: false,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey),
          suffixIcon: Icon(Icons.settings, color: Colors.grey),
          hintText: "Search pet to adopt",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
