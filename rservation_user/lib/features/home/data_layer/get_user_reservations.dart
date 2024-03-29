class UserReservations {
  bool? success;
  List<Data>? data;

  UserReservations({this.success, this.data});

  UserReservations.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? categoryName;
  String? itemId;
  String? time;
  String? timeOfReservation;
  String? additionalOptions;
  String? status;
  String? document;
  String? approveOfPayment;
  String? paid;
  Item? item;

  Data(
      {this.id,
        this.userId,
        this.categoryName,
        this.itemId,
        this.time,
        this.timeOfReservation,
        this.additionalOptions,
        this.status,
        this.document,
        this.approveOfPayment,
        this.paid,
        this.item});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryName = json['category_name'];
    itemId = json['item_id'];
    time = json['time'];
    timeOfReservation = json['time_of_reservation'];
    additionalOptions = json['additional_options'];
    status = json['status'];
    document = json['document'];
    approveOfPayment = json['approve_of_payment'];
    paid = json['paid'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_name'] = this.categoryName;
    data['item_id'] = this.itemId;
    data['time'] = this.time;
    data['time_of_reservation'] = this.timeOfReservation;
    data['additional_options'] = this.additionalOptions;
    data['status'] = this.status;
    data['document'] = this.document;
    data['approve_of_payment'] = this.approveOfPayment;
    data['paid'] = this.paid;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
  String? id;
  String? categoryName;
  String? name;
  String? logo;
  String? image1;
  String? image2;
  String? image3;
  String? type;
  String? description;
  String? address;
  String? availableTimeFrom;
  String? availableTimeTo;
  String? status;
  String? offer;
  String? price;

  Item(
      {this.id,
        this.categoryName,
        this.name,
        this.logo,
        this.image1,
        this.image2,
        this.image3,
        this.type,
        this.description,
        this.address,
        this.availableTimeFrom,
        this.availableTimeTo,
        this.status,
        this.offer,
        this.price});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    name = json['name'];
    logo = json['logo'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    type = json['type'];
    description = json['description'];
    address = json['address'];
    availableTimeFrom = json['available_time_from'];
    availableTimeTo = json['available_time_to'];
    status = json['status'];
    offer = json['offer'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['type'] = this.type;
    data['description'] = this.description;
    data['address'] = this.address;
    data['available_time_from'] = this.availableTimeFrom;
    data['available_time_to'] = this.availableTimeTo;
    data['status'] = this.status;
    data['offer'] = this.offer;
    data['price'] = this.price;
    return data;
  }
}
