import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

Widget packages(BuildContext context, {required List data}) {
  print(data);
  double width = MediaQuery.of(context).size.width;
  return SizedBox(
    height: 270,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length, // Number of containers you want to display
      itemBuilder: (context, index) {
        return Material(
            elevation: 20.0,
            borderRadius: BorderRadius.circular(15),
            // shadowColor: Colors.black.withOpacity(0.75),
            shadowColor: Colors.white,
            child: Container(
              width: 300, // Width of each container
              margin: const EdgeInsets.only(
                  right: 30, top: 10), // Margin around each container
              padding: const EdgeInsets.all(10), // Margin around each container
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(index + 1, (i) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                                SvgPicture.asset('public/svg/gold_badge.svg'),
                          );
                        }),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]['name'].toString().toUpperCase(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.88,
                                fontFamily: "Work Sans",
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 5),
                          Text(data[index]['note'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Work Sans",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300)),
                          const SizedBox(height: 10),
                          Text(data[index]['price'].toString().toUpperCase(),
                              style: const TextStyle(
                                  color: Color(0XFFEC6543),
                                  fontFamily: "Work Sans",
                                  fontSize: 26.73,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 5),
                          Text(data[index]['price_note'].toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Work Sans",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              if (data[index]['name'] == "diamond package") {
                                context.push('/all_design',
                                    extra: {'planFilter': 'diamond'});
                              } else if (data[index]['name'] ==
                                  "gold package") {
                                // Pass 'gold' for first 12 products
                                context.push('/all_design',
                                    extra: {'planFilter': 'gold'});
                              } else if (data[index]['name'] ==
                                  "platinum package") {
                                context.push('/all_design',
                                    extra: {'planFilter': "platinum"});
                              } else {
                                // Pass null for all products
                                context.push('/all_design',
                                    extra: {'planFilter': null});
                              }
                            },
                            child: Container(
                                width: width * 0.45,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: const Color(0XFF561505),
                                    borderRadius: BorderRadius.circular(2.56)),
                                child: const Center(
                                  child: Text(
                                    "GET STARTED",
                                    style: TextStyle(
                                        fontFamily: "Work Sans",
                                        color: Colors.white),
                                  ),
                                )),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset('public/svg/chat.svg'),
                              SizedBox(
                                width: width * 0.45,
                                child: Text(
                                  'Access to any eight(${data[index]['no_of_workbook']}) E-engineering interactive Workbook',
                                  style: TextStyle(
                                      fontFamily: "Work Sans",
                                      fontSize: 11,
                                      color: Colors.black,
                                      height: 1.5),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    ),
  );
}
