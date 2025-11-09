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
  final String? planFilter;

  const AllEngineeringDesign({super.key, this.planFilter});

  @override
  ConsumerState<AllEngineeringDesign> createState() =>
      _AllEngineeringDesignState();
}

class _AllEngineeringDesignState extends ConsumerState<AllEngineeringDesign> {
  List<ProductDesign> filteredProducts = [];
  late List<ProductDesign> planBasedProducts;

  @override
  void initState() {
    super.initState();
    // Initialize with plan-based filtering
    _initializeProducts();
  }

  void _initializeProducts() {
    final allProducts = ref.read(productDesignProvider) ?? [];

    // Filter based on plan
    if (widget.planFilter == 'diamond') {
      planBasedProducts = allProducts.take(9).toList();
    } else if (widget.planFilter == 'gold') {
      planBasedProducts = allProducts.take(12).toList();
    } else {
      planBasedProducts = allProducts;
    }

    filteredProducts = planBasedProducts;
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredProducts = planBasedProducts;
      });
    } else {
      setState(() {
        filteredProducts = planBasedProducts
            .where((product) =>
                product.product.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);
    final productsDesign = ref.watch(productDesignProvider);

    // Re-initialize if products change
    if (productsDesign != null && planBasedProducts.isEmpty) {
      _initializeProducts();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  const SizedBox(height: 10),

              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backNavigation(context),
                  Text(
                    "${widget.planFilter?.toUpperCase() ?? "All"} Workbooks",
                    style: TextStyle(
                      fontFamily: "Work Sans",
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 204, 127, 127),
                      fontSize: 22,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 24),

              // Search Bar
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Search designs...',
                    labelStyle: TextStyle(
                      fontFamily: "Work Sans",
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[600],
                      size: 22,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onChanged: (text) {
                    filterSearchResults(text);
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Results Count
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '${filteredProducts.length} ${filteredProducts.length == 1 ? 'Design' : 'Designs'} Available',
                  style: TextStyle(
                    fontFamily: "Work Sans",
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Products List
              filteredProducts.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No designs found',
                              style: TextStyle(
                                fontFamily: "Work Sans",
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              // Handle the tap action here
                            },
                            child: design(
                              context,
                              filteredProducts[index],
                              plan: profile!.plan,
                              index: index,
                            ),
                          ),
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
