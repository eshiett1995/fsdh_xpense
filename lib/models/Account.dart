import 'package:hive/hive.dart';

class Account extends HiveObject {
  int id;
  String name;
  String nuban;
  String cardNumber;
  String expiry;
  double balance;
  String bank;
  bool selected;


  Account({this.name, this.nuban, this.cardNumber, this.expiry, this.balance,
      this.bank, this.selected});

  Account.fromJson(Map<String, dynamic> json) :
        id = json['_id'],
        name = json['name'],
        nuban = json['nuban'],
        cardNumber = json['cardNumber'],
        expiry = json['expiry'],
        balance = json['balance'],
        bank = json['bank'],
        selected = json['selected'];
}

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final typeId = 3;

  @override
  Account read(BinaryReader reader) {
    return Account(
      id: reader.read(),
      name: reader.read(),
      imageUrl: reader.read(),
      selected: reader.readBool(),
      synonyms: reader.readStringList(),
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.imageUrl);
    writer.writeBool(obj.selected);
    writer.writeStringList(obj.synonyms);
  }
}