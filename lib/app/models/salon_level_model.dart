/*
 * Copyright (c) 2020 .
 */

import 'dart:core';

import 'parents/model.dart';

class SalonLevel extends Model {
  String? _name;
  double? _commission;

  SalonLevel({String? id, String? name, double? commission}) {
    _commission = commission;
    _name = name;
    this.id = id;
  }

  String get name => _name ?? '';

  set name(String? value) {
    _name = value;
  }

  double get commission => _commission ?? 0;

  set commission(double? value) {
    _commission = value;
  }

  SalonLevel.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    _name = transStringFromJson(json, 'name');
    _commission = doubleFromJson(json, 'commission');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['commission'] = this.commission;
    return data;
  }
}
