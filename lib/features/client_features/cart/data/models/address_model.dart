class AddressModel {
  AddressModel({
    this.clientId,
    this.fullName,
    this.state,
    this.city,
    this.phoneNumber,
    this.addressLine,
    this.id,
  });

  int? clientId;
  String? fullName;
  String? state;
  String? city;
  String? phoneNumber;
  String? addressLine;
  int? id;

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      clientId: json["client_id"],
      fullName: json["full_name"],
      state: json["state"],
      city: json["city"],
      phoneNumber: json["phone_number"],
      addressLine: json["address_line"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "full_name": fullName,
        "state": state,
        "city": city,
        "phone_number": phoneNumber,
        "address_line": addressLine,
        "id": id,
      };
}
