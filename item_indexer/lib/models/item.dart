import 'package:app_core/app_core.dart';
import 'package:meta/meta.dart';
import 'package:repository_core/repository_core.dart';


@immutable
class Item {
  final String id;
  final String name;
  final String description;
  final String bin;
  final bool checkedOut;

  Item(this.name, this.bin, {String description = '', String id, bool checkedOut = false})
      : description = description ?? '',
        id = id ?? Uuid().generateV4(),
        checkedOut = checkedOut ?? false;

  Item copyWith({String id, String name, String description, String bin, bool checkedOut}) {
    return Item(
      name ?? this.name,
      bin ?? this.bin,
      id: id ?? this.id,
      description: description ?? this.description,
      checkedOut: checkedOut ?? this.checkedOut,
    );
  }

  @override
  int get hashCode =>
      checkedOut.hashCode ^ name.hashCode ^ description.hashCode ^ id.hashCode ^ bin.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          checkedOut == other.checkedOut &&
          bin == other.bin;

  @override
  String toString() {
    return 'Item{name: $name, description: $description, bin: $bin, checkedOut: $checkedOut, id: $id}';
  }

  
  ItemEntity toEntity() {
    return ItemEntity(id, name, bin, description, checkedOut);
  }

  static Item fromEntity(ItemEntity entity) {
    return Item(
      entity.name,
      entity.bin,
      description: entity.description ?? '',
      id: entity.id ?? Uuid().generateV4(),
      checkedOut: entity.checkedOut ?? false,
    );
  }
}

