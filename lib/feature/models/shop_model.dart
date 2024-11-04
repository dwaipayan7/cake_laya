class ShopModel {
  final String shopName;
  final String fssaiLicense;
  final int commission;
  final DeliverySettings deliverySettings;

  ShopModel({
    required this.shopName,
    required this.fssaiLicense,
    required this.commission,
    required this.deliverySettings,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
      shopName: json['shopName'],
      fssaiLicense: json['fssaiLicense'],
      commission: json['commission'],
      deliverySettings: DeliverySettings.fromJson(json['deliverySettings']),
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

  factory DeliverySettings.fromJson(Map<String, dynamic> json) {
    return DeliverySettings(
      deliveryTime: json['deliveryTime'],
      deliveryRadius: json['deliveryRadius'],
      freeDeliveryRadius: json['freeDeliveryRadius'],
      feesAbove500: json['feesAbove500'],
      feesBelow500: json['feesBelow500'],
    );
  }
}
