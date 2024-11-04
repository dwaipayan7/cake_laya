class ShopModel {
  final String? shopName; // Nullable
  final String? fssaiLicense; // Nullable
  final int commission;
  final DeliverySettings deliverySettings;

  ShopModel({
    required this.shopName,
    required this.fssaiLicense,
    required this.commission,
    required this.deliverySettings,
  });

  // Convert ShopModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'shopName': shopName,
      'fssaiLicense': fssaiLicense,
      'commission': commission,
      'deliverySettings': deliverySettings.toJson(),
    };
  }

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    // Check if deliverySettings is null and provide a default if necessary
    final deliverySettingsJson = json['deliverySettings'] as Map<String, dynamic>?;

    return ShopModel(
      shopName: json['shopName'] as String?, // Cast to nullable
      fssaiLicense: json['fssaiLicense'] as String?, // Cast to nullable
      commission: json['commission'] ?? 0, // Provide a default value
      deliverySettings: DeliverySettings.fromJson(deliverySettingsJson ?? {}), // Provide an empty map if null
    );
  }
}

class DeliverySettings {
  final int deliveryTime;
  final int deliveryRadius;
  final int freeDeliveryRadius;
  final int feesAbove500;
  final int feesBelow500;

  DeliverySettings({
    required this.deliveryTime,
    required this.deliveryRadius,
    required this.freeDeliveryRadius,
    required this.feesAbove500,
    required this.feesBelow500,
  });

  // Convert DeliverySettings to JSON
  Map<String, dynamic> toJson() {
    return {
      'deliveryTime': deliveryTime,
      'deliveryRadius': deliveryRadius,
      'freeDeliveryRadius': freeDeliveryRadius,
      'feesAbove500': feesAbove500,
      'feesBelow500': feesBelow500,
    };
  }

  factory DeliverySettings.fromJson(Map<String, dynamic> json) {
    return DeliverySettings(
      deliveryTime: json['deliveryTime'] ?? 0, // Provide a default value
      deliveryRadius: json['deliveryRadius'] ?? 0, // Provide a default value
      freeDeliveryRadius: json['freeDeliveryRadius'] ?? 0, // Provide a default value
      feesAbove500: json['feesAbove500'] ?? 0, // Provide a default value
      feesBelow500: json['feesBelow500'] ?? 0, // Provide a default value
    );
  }
}