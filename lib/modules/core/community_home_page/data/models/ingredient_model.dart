class IngredientModel {
  final String elementName;
  final String servingSize;
  final int quantity;

  IngredientModel({
    required this.elementName,
    required this.servingSize,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'element_name': elementName,
      'servingSize': servingSize,
      'quantity': quantity,
    };
  }

  factory IngredientModel.fromMap(Map<String, dynamic> map) {
    return IngredientModel(
      elementName: map['element_name'],
      servingSize: map['servingSize'],
      quantity: map['quantity'],
    );
  }
}
