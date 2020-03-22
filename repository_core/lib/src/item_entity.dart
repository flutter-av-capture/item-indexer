

class ItemEntity {
  final String id;
  final String name;
  final String bin;
  final String description;
  final bool checkedOut;

  ItemEntity(this.id, this.name, this.bin, this.description, this.checkedOut);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ bin.hashCode ^ description.hashCode ^ checkedOut.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          bin == other.bin;

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'bin': bin,
      'description': description,
      'checkedOut': checkedOut
    };
  }

  @override
  String toString() {
    return 'ItemEntity{id: $id, name: $name, bin: $bin, description: $description, checkedOut: $checkedOut}';
  }

  static ItemEntity fromJson(Map<String, Object> json) {
    return ItemEntity(
      json['id'] as String,
      json['name'] as String,
      json['bin'] as String,
      json['description'] as String,
      json['checkedOut'] as bool
    );
  }
}
