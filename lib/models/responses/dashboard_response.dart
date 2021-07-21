// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) =>
    DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) =>
    json.encode(data.toJson());

class DashboardResponse {
  DashboardResponse({
    this.detail,
  });

  Detail? detail;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      DashboardResponse(
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail == null ? null : detail!.toJson(),
      };
}

class Detail {
  Detail({
    this.statement,
    this.currentPlan,
    this.planValidity,
    this.expiryDate,
    this.records,
    this.p2PIncoming,
    this.payBillsIncoming,
    this.incomingAgentDeposits,
    this.p2POutgoing,
    this.paybillPymts,
    this.outgoingAgentWithdrawals,
    this.usualBalance,
    this.fuliza,
    this.quickSummaries,
    this.brands,
    this.recommendations,
  });

  String? statement;
  String? currentPlan;
  String? planValidity;
  String? expiryDate;
  int? records;
  P2PIncoming? p2PIncoming;
  PayBillsIncoming? payBillsIncoming;
  IncomingAgentDeposits? incomingAgentDeposits;
  P2POutgoing? p2POutgoing;
  PaybillPymts? paybillPymts;
  OutgoingAgentWithdrawals? outgoingAgentWithdrawals;
  String? usualBalance;
  Fuliza? fuliza;
  QuickSummaries? quickSummaries;
  Brands? brands;
  String? recommendations;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        statement: json["Statement"] == null ? null : json["Statement"],
        currentPlan: json["Current Plan"] == null ? null : json["Current Plan"],
        planValidity:
            json["Plan_validity"] == null ? null : json["Plan_validity"],
        expiryDate: json["Expiry_date"] == null ? null : json["Expiry_date"],
        records: json["Records"] == null ? null : json["Records"],
        p2PIncoming: json["P2P Incoming"] == null
            ? null
            : P2PIncoming.fromJson(json["P2P Incoming"]),
        payBillsIncoming: json["PayBills Incoming"] == null
            ? null
            : PayBillsIncoming.fromJson(json["PayBills Incoming"]),
        incomingAgentDeposits: json["Incoming_agent_deposits"] == null
            ? null
            : IncomingAgentDeposits.fromJson(json["Incoming_agent_deposits"]),
        p2POutgoing: json["P2P Outgoing"] == null
            ? null
            : P2POutgoing.fromJson(json["P2P Outgoing"]),
        paybillPymts: json["paybill_pymts"] == null
            ? null
            : PaybillPymts.fromJson(json["paybill_pymts"]),
        outgoingAgentWithdrawals: json["Outgoing_Agent_Withdrawals"] == null
            ? null
            : OutgoingAgentWithdrawals.fromJson(
                json["Outgoing_Agent_Withdrawals"]),
        usualBalance:
            json["usual_balance"] == null ? null : json["usual_balance"],
        fuliza: json["fuliza"] == null ? null : Fuliza.fromJson(json["fuliza"]),
        quickSummaries: json["quick_summaries"] == null
            ? null
            : QuickSummaries.fromJson(json["quick_summaries"]),
        brands: json["brands"] == null ? null : Brands.fromJson(json["brands"]),
        recommendations:
            json["recommendations"] == null ? null : json["recommendations"],
      );

  Map<String, dynamic> toJson() => {
        "Statement": statement == null ? null : statement,
        "Current Plan": currentPlan == null ? null : currentPlan,
        "Plan_validity": planValidity == null ? null : planValidity,
        "Expiry_date": expiryDate == null ? null : expiryDate,
        "Records": records == null ? null : records,
        "P2P Incoming": p2PIncoming == null ? null : p2PIncoming!.toJson(),
        "PayBills Incoming":
            payBillsIncoming == null ? null : payBillsIncoming!.toJson(),
        "Incoming_agent_deposits": incomingAgentDeposits == null
            ? null
            : incomingAgentDeposits!.toJson(),
        "P2P Outgoing": p2POutgoing == null ? null : p2POutgoing!.toJson(),
        "paybill_pymts": paybillPymts == null ? null : paybillPymts!.toJson(),
        "Outgoing_Agent_Withdrawals": outgoingAgentWithdrawals == null
            ? null
            : outgoingAgentWithdrawals!.toJson(),
        "usual_balance": usualBalance == null ? null : usualBalance,
        "fuliza": fuliza == null ? null : fuliza!.toJson(),
        "quick_summaries":
            quickSummaries == null ? null : quickSummaries!.toJson(),
        "brands": brands == null ? null : brands!.toJson(),
        "recommendations": recommendations == null ? null : recommendations,
      };
}

class Brands {
  Brands({
    this.petrolStations,
    this.restaurants,
    this.insurance,
    this.investPensionsSvngs,
    this.lifestyle,
    this.supermarkets,
    this.homeInternetAndTv,
    this.pharmacy,
  });

  List<Lifestyle>? petrolStations;
  List<Lifestyle>? restaurants;
  List<Lifestyle>? insurance;
  List<Lifestyle>? investPensionsSvngs;
  List<Lifestyle>? lifestyle;
  List<Lifestyle>? supermarkets;
  List<Lifestyle>? homeInternetAndTv;
  List<Lifestyle>? pharmacy;

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
        petrolStations: json["petrol_stations"] == null
            ? []
            : List<Lifestyle>.from(
                json["petrol_stations"].map((x) => Lifestyle.fromJson(x))),
        restaurants: json["restaurants"] == null
            ? []
            : List<Lifestyle>.from(
                json["restaurants"].map((x) => Lifestyle.fromJson(x))),
        insurance: json["insurance"] == null
            ? []
            : List<Lifestyle>.from(
                json["insurance"].map((x) => Lifestyle.fromJson(x))),
        investPensionsSvngs: json["invest_pensions_svngs"] == null
            ? []
            : List<Lifestyle>.from(json["invest_pensions_svngs"]
                .map((x) => Lifestyle.fromJson(x))),
        lifestyle: json["lifestyle"] == null
            ? []
            : List<Lifestyle>.from(
                json["lifestyle"].map((x) => Lifestyle.fromJson(x))),
        supermarkets: json["supermarkets"] == null
            ? []
            : List<Lifestyle>.from(
                json["supermarkets"].map((x) => Lifestyle.fromJson(x))),
        homeInternetAndTv: json["home_internet_and_tv"] == null
            ? []
            : List<Lifestyle>.from(
                json["home_internet_and_tv"].map((x) => Lifestyle.fromJson(x))),
        pharmacy: json["pharmacy"] == null
            ? []
            : List<Lifestyle>.from(
                json["pharmacy"].map((x) => Lifestyle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "petrol_stations": petrolStations == null
            ? null
            : List<dynamic>.from(petrolStations!.map((x) => x.toJson())),
        "restaurants": restaurants == null
            ? null
            : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
        "insurance": insurance,
        "invest_pensions_svngs": investPensionsSvngs == null
            ? null
            : List<dynamic>.from(investPensionsSvngs!.map((x) => x.toJson())),
        "lifestyle": lifestyle == null
            ? null
            : List<dynamic>.from(lifestyle!.map((x) => x.toJson())),
        "supermarkets": supermarkets == null
            ? null
            : List<dynamic>.from(supermarkets!.map((x) => x.toJson())),
        "home_internet_and_tv": homeInternetAndTv == null
            ? null
            : List<dynamic>.from(homeInternetAndTv!.map((x) => x.toJson())),
        "pharmacy": pharmacy,
      };
}

class Lifestyle {
  Lifestyle({
    this.name,
    this.transactions,
    this.spent,
  });

  String? name;
  int? transactions;
  String? spent;

  factory Lifestyle.fromJson(Map<String, dynamic> json) => Lifestyle(
        name: json["name"] == null ? null : json["name"],
        transactions: json["transactions"] == null ? 1 : json["transactions"],
        spent: json["Spent"] == null ? null : json["Spent"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "transactions": transactions == null ? null : transactions,
        "Spent": spent == null ? null : spent,
      };
}

class Fuliza {
  Fuliza({
    this.ttlFulizaToComplete,
    this.percentFulizaPymts,
    this.monthDaysFulizaing,
  });

  String? ttlFulizaToComplete;
  String? percentFulizaPymts;
  int? monthDaysFulizaing;

  factory Fuliza.fromJson(Map<String, dynamic> json) => Fuliza(
        ttlFulizaToComplete: json["ttl_fuliza_to_complete"] == null
            ? null
            : json["ttl_fuliza_to_complete"],
        percentFulizaPymts: json["percent_fuliza_pymts"] == null
            ? null
            : json["percent_fuliza_pymts"],
        monthDaysFulizaing: json["month_days_fulizaing"] == null
            ? null
            : json["month_days_fulizaing"],
      );

  Map<String, dynamic> toJson() => {
        "ttl_fuliza_to_complete":
            ttlFulizaToComplete == null ? null : ttlFulizaToComplete,
        "percent_fuliza_pymts":
            percentFulizaPymts == null ? null : percentFulizaPymts,
        "month_days_fulizaing":
            monthDaysFulizaing == null ? null : monthDaysFulizaing,
      };
}

class IncomingAgentDeposits {
  IncomingAgentDeposits({
    this.records,
    this.total,
  });

  List<RecordIncomingAgentDeposits>? records;
  String? total;

  factory IncomingAgentDeposits.fromJson(Map<String, dynamic> json) =>
      IncomingAgentDeposits(
        records: json["records"] == null
            ? null
            : List<RecordIncomingAgentDeposits>.from(json["records"]
                .map((x) => RecordIncomingAgentDeposits.fromJson(x))),
        total: json["Total"] == null ? null : json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? null
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "Total": total == null ? null : total,
      };
}

class RecordIncomingAgentDeposits {
  RecordIncomingAgentDeposits({
    this.nos,
    this.tillNos,
    this.tillOwner,
    this.amt,
  });

  int? nos;
  String? tillNos;
  String? tillOwner;
  String? amt;

  factory RecordIncomingAgentDeposits.fromJson(Map<String, dynamic> json) =>
      RecordIncomingAgentDeposits(
        nos: json["nos"] == null ? null : json["nos"],
        tillNos: json["Till Nos"] == null ? null : json["Till Nos"],
        tillOwner: json["Till Owner"] == null ? null : json["Till Owner"],
        amt: json["amt"] == null ? null : json["amt"],
      );

  Map<String, dynamic> toJson() => {
        "nos": nos == null ? null : nos,
        "Till Nos": tillNos == null ? null : tillNos,
        "Till Owner": tillOwner == null ? null : tillOwner,
        "amt": amt == null ? null : amt,
      };
}

class OutgoingAgentWithdrawals {
  OutgoingAgentWithdrawals({
    this.records,
    this.total,
  });

  List<RecordOutgoingAgentWithdrawals>? records;
  String? total;

  factory OutgoingAgentWithdrawals.fromJson(Map<String, dynamic> json) =>
      OutgoingAgentWithdrawals(
        records: json["records"] == null
            ? null
            : List<RecordOutgoingAgentWithdrawals>.from(json["records"]
                .map((x) => RecordOutgoingAgentWithdrawals.fromJson(x))),
        total: json["Total"] == null ? null : json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? null
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "Total": total == null ? null : total,
      };
}

class RecordOutgoingAgentWithdrawals {
  RecordOutgoingAgentWithdrawals({
    this.nos,
    this.tillNos,
    this.tillOwner,
    this.amt,
  });

  int? nos;
  String? tillNos;
  String? tillOwner;
  String? amt;

  factory RecordOutgoingAgentWithdrawals.fromJson(Map<String, dynamic> json) =>
      RecordOutgoingAgentWithdrawals(
        nos: json["nos"] == null ? null : json["nos"],
        tillNos: json["Till Nos"] == null ? null : json["Till Nos"],
        tillOwner: json["Till Owner"] == null ? null : json["Till Owner"],
        amt: json["amt"] == null ? null : json["amt"],
      );

  Map<String, dynamic> toJson() => {
        "nos": nos == null ? null : nos,
        "Till Nos": tillNos == null ? null : tillNos,
        "Till Owner": tillOwner == null ? null : tillOwner,
        "amt": amt == null ? null : amt,
      };
}

class P2PIncoming {
  P2PIncoming({
    this.records,
    this.total,
  });

  List<RecordP2PIncoming>? records;
  String? total;

  factory P2PIncoming.fromJson(Map<String, dynamic> json) => P2PIncoming(
        records: json["records"] == null
            ? null
            : List<RecordP2PIncoming>.from(
                json["records"].map((x) => RecordP2PIncoming.fromJson(x))),
        total: json["Total"] == null ? null : json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? null
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "Total": total == null ? null : total,
      };
}

class RecordP2PIncoming {
  RecordP2PIncoming({
    this.nos,
    this.name,
    this.amt,
  });

  int? nos;
  String? name;
  String? amt;

  factory RecordP2PIncoming.fromJson(Map<String, dynamic> json) =>
      RecordP2PIncoming(
        nos: json["nos"] == null ? null : json["nos"],
        name: json["name"] == null ? null : json["name"],
        amt: json["amt"] == null ? null : json["amt"],
      );

  Map<String, dynamic> toJson() => {
        "nos": nos == null ? null : nos,
        "name": name == null ? null : name,
        "amt": amt == null ? null : amt,
      };
}

class P2POutgoing {
  P2POutgoing({
    this.records,
    this.total,
  });

  List<RecordP2POutgoing>? records;
  String? total;

  factory P2POutgoing.fromJson(Map<String, dynamic> json) => P2POutgoing(
        records: json["records"] == null
            ? null
            : List<RecordP2POutgoing>.from(
                json["records"].map((x) => RecordP2POutgoing.fromJson(x))),
        total: json["Total"] == null ? null : json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? null
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "Total": total == null ? null : total,
      };
}

class RecordP2POutgoing {
  RecordP2POutgoing({
    this.nos,
    this.name,
    this.number,
    this.amt,
  });

  int? nos;
  String? name;
  String? number;
  String? amt;

  factory RecordP2POutgoing.fromJson(Map<String, dynamic> json) =>
      RecordP2POutgoing(
        nos: json["nos"] == null ? null : json["nos"],
        name: json["Name"] == null ? null : json["Name"],
        number: json["number"] == null ? null : json["number"],
        amt: json["amt"] == null ? null : json["amt"],
      );

  Map<String, dynamic> toJson() => {
        "nos": nos == null ? null : nos,
        "Name": name == null ? null : name,
        "number": number == null ? null : number,
        "amt": amt == null ? null : amt,
      };
}

class PayBillsIncoming {
  PayBillsIncoming({
    this.records,
    this.total,
  });

  List<RecordPaybillsIncoming>? records;
  String? total;

  factory PayBillsIncoming.fromJson(Map<String, dynamic> json) =>
      PayBillsIncoming(
        records: json["records"] == null
            ? null
            : List<RecordPaybillsIncoming>.from(
                json["records"].map((x) => RecordPaybillsIncoming.fromJson(x))),
        total: json["Total"] == null ? null : json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? null
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "Total": total == null ? null : total,
      };
}

class RecordPaybillsIncoming {
  RecordPaybillsIncoming({
    this.nos,
    this.b2CPaybill,
    this.b2CPaybillName,
    this.amt,
  });

  int? nos;
  String? b2CPaybill;
  String? b2CPaybillName;
  String? amt;

  factory RecordPaybillsIncoming.fromJson(Map<String, dynamic> json) =>
      RecordPaybillsIncoming(
        nos: json["nos"] == null ? null : json["nos"],
        b2CPaybill: json["B2C_Paybill"] == null ? null : json["B2C_Paybill"],
        b2CPaybillName:
            json["B2C_Paybill_name"] == null ? null : json["B2C_Paybill_name"],
        amt: json["amt"] == null ? null : json["amt"],
      );

  Map<String, dynamic> toJson() => {
        "nos": nos == null ? null : nos,
        "B2C_Paybill": b2CPaybill == null ? null : b2CPaybill,
        "B2C_Paybill_name": b2CPaybillName == null ? null : b2CPaybillName,
        "amt": amt == null ? null : amt,
      };
}

class PaybillPymts {
  PaybillPymts({
    this.records,
    this.total,
  });

  List<RecordPaybillPymts>? records;
  String? total;

  factory PaybillPymts.fromJson(Map<String, dynamic> json) => PaybillPymts(
        records: json["records"] == null
            ? null
            : List<RecordPaybillPymts>.from(
                json["records"].map((x) => RecordPaybillPymts.fromJson(x))),
        total: json["Total"] == null ? null : json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? null
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "Total": total == null ? null : total,
      };
}

class RecordPaybillPymts {
  RecordPaybillPymts({
    this.nos,
    this.paybill,
    this.paybillName,
    this.amt,
  });

  int? nos;
  String? paybill;
  String? paybillName;
  String? amt;

  factory RecordPaybillPymts.fromJson(Map<String, dynamic> json) =>
      RecordPaybillPymts(
        nos: json["nos"] == null ? null : json["nos"],
        paybill: json["Paybill"] == null ? null : json["Paybill"],
        paybillName: json["Paybill_name"] == null ? null : json["Paybill_name"],
        amt: json["amt"] == null ? null : json["amt"],
      );

  Map<String, dynamic> toJson() => {
        "nos": nos == null ? null : nos,
        "Paybill": paybill == null ? null : paybill,
        "Paybill_name": paybillName == null ? null : paybillName,
        "amt": amt == null ? null : amt,
      };
}

class QuickSummaries {
  QuickSummaries({
    this.incomingSources,
    this.outgoingSources,
    this.mpesaCharges,
    this.yourTopLocations,
  });

  Map<String, IncomingSource>? incomingSources;
  Map<String, OutgoingSource>? outgoingSources;
  Map<String, MpesaCharge>? mpesaCharges;
  List<String>? yourTopLocations;

  factory QuickSummaries.fromJson(Map<String, dynamic> json) => QuickSummaries(
        incomingSources: json["Incoming_sources"] == null
            ? null
            : Map.from(json["Incoming_sources"]).map((k, v) =>
                MapEntry<String, IncomingSource>(
                    k, IncomingSource.fromJson(v))),
        outgoingSources: json["Outgoing_sources"] == null
            ? null
            : Map.from(json["Outgoing_sources"]).map((k, v) =>
                MapEntry<String, OutgoingSource>(
                    k, OutgoingSource.fromJson(v))),
        mpesaCharges: json["mpesa_charges"] == null
            ? null
            : Map.from(json["mpesa_charges"]).map((k, v) =>
                MapEntry<String, MpesaCharge>(k, MpesaCharge.fromJson(v))),
        yourTopLocations: json["your_top_locations"] == null
            ? null
            : List<String>.from(json["your_top_locations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Incoming_sources": incomingSources == null
            ? null
            : Map.from(incomingSources!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "Outgoing_sources": outgoingSources == null
            ? null
            : Map.from(outgoingSources!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "mpesa_charges": mpesaCharges == null
            ? null
            : Map.from(mpesaCharges!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "your_top_locations": yourTopLocations == null
            ? null
            : List<dynamic>.from(yourTopLocations!.map((x) => x)),
      };
}

class IncomingSource {
  IncomingSource({
    this.description,
    this.fromMobiles,
    this.fromPaybills,
    this.fromAgents,
  });

  String? description;
  String? fromMobiles;
  String? fromPaybills;
  String? fromAgents;

  factory IncomingSource.fromJson(Map<String, dynamic> json) => IncomingSource(
        description: json["Description"] == null ? null : json["Description"],
        fromMobiles: json["From Mobiles"] == null ? null : json["From Mobiles"],
        fromPaybills:
            json["From Paybills"] == null ? null : json["From Paybills"],
        fromAgents: json["From Agents"] == null ? null : json["From Agents"],
      );

  Map<String, dynamic> toJson() => {
        "Description": description == null ? null : description,
        "From Mobiles": fromMobiles == null ? null : fromMobiles,
        "From Paybills": fromPaybills == null ? null : fromPaybills,
        "From Agents": fromAgents == null ? null : fromAgents,
      };
}

class MpesaCharge {
  MpesaCharge({
    this.details,
    this.charge,
  });

  String? details;
  String? charge;

  factory MpesaCharge.fromJson(Map<String, dynamic> json) => MpesaCharge(
        details: json["Details"] == null ? null : json["Details"],
        charge: json["Charge"] == null ? null : json["Charge"],
      );

  Map<String, dynamic> toJson() => {
        "Details": details == null ? null : details,
        "Charge": charge == null ? null : charge,
      };
}

class OutgoingSource {
  OutgoingSource({
    this.description,
    this.total,
    this.nosOfTransactions,
  });

  String? description;
  String? total;
  int? nosOfTransactions;

  factory OutgoingSource.fromJson(Map<String, dynamic> json) => OutgoingSource(
        description: json["Description"] == null ? null : json["Description"],
        total: json["Total"] == null ? null : json["Total"],
        nosOfTransactions: json["Nos of Transactions"] == null
            ? null
            : json["Nos of Transactions"],
      );

  Map<String, dynamic> toJson() => {
        "Description": description == null ? null : description,
        "Total": total == null ? null : total,
        "Nos of Transactions":
            nosOfTransactions == null ? null : nosOfTransactions,
      };
}
