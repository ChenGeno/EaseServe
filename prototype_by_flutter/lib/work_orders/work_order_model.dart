import 'package:flutter/material.dart';

class WorkOrderSummary {
  final String orderNumber;
  final String customerName;
  final String address;
  final String appointmentDateLabel;
  final String appointmentTime;
  final String orderType;
  final String orderSubType;
  final String productSerial;
  final String productModel;
  final String projectName;
  final String spareStatus;
  final String contactPhone;
  final List<String> tags;
  final String statusLabel;
  final Color statusColor;

  const WorkOrderSummary({
    required this.orderNumber,
    required this.customerName,
    required this.address,
    this.appointmentDateLabel = '',
    required this.appointmentTime,
    required this.orderType,
    this.orderSubType = '',
    required this.productSerial,
    required this.productModel,
    required this.projectName,
    required this.spareStatus,
    this.contactPhone = '',
    this.tags = const [],
    required this.statusLabel,
    required this.statusColor,
  });
}
