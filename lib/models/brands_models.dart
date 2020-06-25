import 'dart:convert';

Brands brandsFromJson(String str) => Brands.fromJson(json.decode(str));

String brandsToJson(Brands data) => json.encode(data.toJson());

class Brands {
    Brands({
        this.brand,
    });

   
   final String brand;

    factory Brands.fromJson(Map<String, dynamic> json) => Brands(
        brand: json["brand"],
    );

    Map<String, dynamic> toJson() => {
        "brand": brand,
    };
}
