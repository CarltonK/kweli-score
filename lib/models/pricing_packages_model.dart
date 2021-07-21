class PricingPackageModel {
  String? packageName;
  int? packagePrice;
  PricingPackageModel({this.packageName, this.packagePrice});
}

PricingPackageModel swara = PricingPackageModel(packageName: 'Swara');

PricingPackageModel chui = PricingPackageModel(
  packageName: 'Chui',
  packagePrice: 29,
);

PricingPackageModel simba = PricingPackageModel(
  packageName: 'Simba',
  packagePrice: 249,
);

List<PricingPackageModel> currentPackages = [swara, chui, simba];
