import 'package:esoger/models/product_design.dart';
import 'package:esoger/ui/widget/button/back_navigation.dart';
import 'package:flutter/material.dart';
import './widget/header.dart';
import '../../widget/equipment_design.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:esoger/provider/product_design.dart';
import 'package:esoger/ui/widget/equipment_design.dart';
import 'package:esoger/provider/profile.dart';

class AllEngineeringDesign extends ConsumerStatefulWidget {
  AllEngineeringDesign({super.key});

  @override
  ConsumerState<AllEngineeringDesign> createState() =>
      _AllEngineeringDesignState();
}

class _AllEngineeringDesignState extends ConsumerState<AllEngineeringDesign> {
  List<ProductDesign> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredProducts with all products initially
    filteredProducts = ref.read(productDesignProvider) ?? [];
  }

  void filterSearchResults(String query) {
    final allProducts = ref.read(productDesignProvider) ?? [];

    if (query.isEmpty) {
      // Show all products if the search query is empty
      setState(() {
        filteredProducts = allProducts;
      });
    } else {
      setState(() {
        filteredProducts = allProducts
            .where((product) => product.product
                .toLowerCase()
                .contains(query.toLowerCase())) // Match search with name
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);
    final productsDesign = ref.watch(productDesignProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backNavigation(context),
                  const Text(
                    "Equipment Design",
                    style: TextStyle(
                      fontFamily: "Work Sans",
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF2C2C2C),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              const SizedBox(height: 20),
              Form(
                child: SizedBox(
                  height: 40,
                  child: Material(
                    elevation: 12.0,
                    borderRadius: BorderRadius.circular(8),
                    shadowColor: Colors.black.withOpacity(0.75),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Search Now',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (text) {
                        filterSearchResults(
                            text); // Filter based on search text
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Using ListView.builder for better performance
              ListView.builder(
                shrinkWrap: true, // Important for scrolling
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling for the parent ScrollView
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle the tap action here
                        },
                        child: design(
                            context,
                            filteredProducts[
                                index], // Use filtered products list
                            plan: profile!.plan,
                            index: index),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
