import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class SchemeData {
  SchemeData({
    this.licenseServerUrl,
    required this.mimeType,
    this.data,
    this.requiresSecureDecryption,
  });

  final String? licenseServerUrl;
  final String mimeType;
  final Uint8List? data;
  final bool? requiresSecureDecryption;

  SchemeData copyWithData(Uint8List? data) => SchemeData(
        licenseServerUrl: licenseServerUrl,
        mimeType: mimeType,
        data: data,
        requiresSecureDecryption: requiresSecureDecryption,
      );

  @override
  bool operator ==(dynamic other) {
    if (other is SchemeData) {
      return other.mimeType == mimeType &&
          other.licenseServerUrl == licenseServerUrl &&
          other.requiresSecureDecryption == requiresSecureDecryption &&
          const ListEquality<int>().equals(other.data, data);
    }
    return false;
  }

  @override
  int get hashCode => Object.hash(
        licenseServerUrl,
        mimeType,
        const ListEquality<int>().hash(data),
        requiresSecureDecryption,
      );
}
