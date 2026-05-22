import 'package:app01/models/category.dart';
import 'package:app01/models/doctor.dart';
import 'package:app01/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoryModel> categoriesData = CategoryModel.getCategories();
  final List<DoctorModel> doctorsData = DoctorModel.getDoctors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [headerSection(), categoriesSection(), doctors()]),
    );
  }

  Widget doctors() {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(doctorModel: doctorsData[index])),
            );
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff51A8FF).withValues(alpha: 0.07),
                  offset: Offset(0, 4),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 105,
                  decoration: BoxDecoration(
                    color: doctorsData[index].imageBox,
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(doctorsData[index].image),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorsData[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        doctorsData[index].specialties.first,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          SizedBox(width: 5),
                          Text(
                            doctorsData[index].score.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: doctorsData.length,
    );
  }

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: 16, left: 20)),
        Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  for (var item in categoriesData) {
                    item.isSelected = false;
                  }
                  categoriesData[index].isSelected = true;
                  setState(() {});
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: categoriesData[index].isSelected
                            ? Color(0xff51A8FF).withValues(alpha: 0.5)
                            : Color(0xff050618).withValues(alpha: 0.5),
                        offset: Offset(0, 8),
                        blurRadius: 32,
                      ),
                    ],
                    color: categoriesData[index].isSelected
                        ? Colors.blue
                        : Colors.white,
                  ),
                  child: SvgPicture.asset(
                    categoriesData[index].vector,
                    fit: BoxFit.none,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 50),
            itemCount: categoriesData.length,
          ),
        ),
      ],
    );
  }

  Container headerSection() {
    return Container(
      color: Color(0xff51A8FF),
      height: 350,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hi, Edi",
                style: TextStyle(fontSize: 18, color: Color(0xffFFFFFF)),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  "assets/vectors/Notification.svg",
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            "Let's find\nyour top doctor!",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search, color: Colors.black, size: 25),
              hintText: "Search here...",
              hintStyle: TextStyle(fontWeight: FontWeight.w300),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
