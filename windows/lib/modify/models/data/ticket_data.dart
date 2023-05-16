import 'package:g_manager_app/modify/models/models.dart';
import 'package:intl/intl.dart';

class TicketData {
  TicketData(
      {int? id,
      String? title,
      int? ticketType,
      int? ticketId,
      int? personId,
      int? customerId,
      int? status,
      DateTime? datenew,
      List<TicketLineData>? ticketlines,
      List<TaxlineData>? taxlines,
      PaymentData? payment,
      ReceiptData? receipt}) {
    _id = id;
    _title = title;
    _ticketType = ticketType;
    _ticketId = ticketId;
    _personId = personId;
    _customerId = customerId;
    _status = status;
    _datenew = datenew;
    _ticketlines = ticketlines;
    _taxlines = taxlines;
    _payment = payment;
    _receipt = receipt;
  }

  TicketData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _ticketType = json['ticket_type'];
    _ticketId = json['ticket_id'];
    _personId = json['person_id'];
    _customerId = json['customer_id'];
    _status = json['status'];
    _datenew = json['datenew'];
    if (json['ticketlines'] != null) {
      _ticketlines = [];
      json['ticketlines'].forEach((v) {
        _ticketlines?.add(TicketLineData.fromJson(v));
      });
    }
    if (json['taxlines'] != null) {
      _taxlines = [];
      json['taxlines'].forEach((v) {
        _taxlines?.add(TaxlineData.fromJson(v));
      });
    }
    _payment =
        json['payment'] != null ? PaymentData.fromJson(json['payment']) : null;
    _receipt =
        json['receipt'] != null ? ReceiptData.fromJson(json['receipt']) : null;
  }

  int? _id;
  String? _title;
  int? _ticketType;
  int? _ticketId;
  int? _personId;
  int? _customerId;
  int? _status;
  DateTime? _datenew;
  List<TicketLineData>? _ticketlines;
  List<TaxlineData>? _taxlines;
  PaymentData? _payment;
  ReceiptData? _receipt;

  TicketData copyWith(
          {int? id,
          String? title,
          int? ticketType,
          int? ticketId,
          int? person,
          int? customer,
          int? status,
          DateTime? datenew,
          List<TicketLineData>? ticketlines,
          List<TaxlineData>? taxlines,
          PaymentData? payment,
          ReceiptData? receipt}) =>
      TicketData(
          id: id ?? _id,
          title: title ?? _title,
          ticketType: ticketType ?? _ticketType,
          ticketId: ticketId ?? _ticketId,
          personId: personId ?? _personId,
          customerId: customerId ?? _customerId,
          status: status ?? _status,
          datenew: datenew ?? _datenew,
          ticketlines: ticketlines ?? _ticketlines,
          taxlines: taxlines ?? _taxlines,
          payment: payment ?? _payment,
          receipt: receipt ?? _receipt);

  int? get id => _id;

  String? get title => _title;

  int? get ticketType => _ticketType;

  int? get ticketId => _ticketId;

  int? get personId => _personId;

  int? get customerId => _customerId;

  int? get status => _status;

  DateTime? get datenew => _datenew;

  List<TicketLineData>? get ticketlines => _ticketlines;

  List<TaxlineData>? get taxlines => _taxlines;

  PaymentData? get payment => _payment;

  ReceiptData? get receipt => _receipt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['ticket_type'] = _ticketType;
    map['ticket_id'] = _ticketId;
    map['person_id'] = _personId;
    map['customer_id'] = _customerId;
    map['status'] = _status;
    map['date'] = DateFormat.yMd().add_Hms().format(_datenew!);
    if (_taxlines != null) {
      map['taxlines'] = _taxlines?.map((v) => v.toJson()).toList();
    }
    if (_ticketlines != null) {
      map['ticketlines'] = _ticketlines?.map((v) => v.toJson()).toList();
    }
    if (_payment != null) {
      map['payment'] = _payment?.toJson();
    }
    if (_receipt != null) {
      map['receipt'] = _receipt?.toJson();
    }
    return map;
  }
}
