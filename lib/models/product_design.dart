class ProductDesign {
  final String product_id;
  final String product;
  final String description;
  final String instruction;
  final String criteria;
  final String purpose;
  final String calculator;
  final String image;

  ProductDesign(
      {required this.product_id,
      required this.product,
      required this.description,
      required this.instruction,
      required this.criteria,
      required this.purpose,
      required this.calculator,
      required this.image});

  factory ProductDesign.fromJson(Map<String, dynamic> json) {
    return ProductDesign(
        product_id: json['product_id'],
        product: json['product'],
        description: json['description'],
        instruction: json['instruction'],
        criteria: json['criteria'],
        purpose: json['purpose'],
        calculator: json['calculator'],
        image: json['image']);
  }

  // Method to convert an instance of ProductDesign to JSON format
  Map<String, dynamic> toJson() {
    return {
      'product_id': product_id,
      'product': product,
      'description': description,
      'instruction': instruction,
      'criteria': criteria,
      'purpose': purpose,
      'calculator': calculator,
      'image': image,
    };
  }
}
