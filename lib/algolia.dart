library algolia;

import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
//import 'package:http/http.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';



part 'src/algolia.dart';

part 'src/index_reference.dart';
part 'src/index_settings.dart';
part 'src/index_snapshot.dart';

part 'src/query.dart';
part 'src/query_snapshot.dart';

part 'src/object_snapshot.dart';
part 'src/object_reference.dart';

part 'src/batch.dart';
part 'src/task.dart';

part 'src/util/json_encode.dart';
