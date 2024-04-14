import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/characters/views/characters_view.dart';

final listGridProvider = StateProvider<ViewType>((ref) => ViewType.list);
