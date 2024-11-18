//* Dart Common Exports
export 'dart:async';
export 'dart:convert';
export 'dart:isolate';
export 'dart:developer' hide Flow;
export 'dart:math' hide log;
export 'dart:ui' show ImageFilter;

//* Flutter Common Exports
export 'package:flutter/services.dart';
export 'package:flutter/material.dart';
export 'package:flutter/cupertino.dart' hide Flow hide ErrorWidget hide RefreshCallback;
export 'package:flutter/foundation.dart';

//* Clean Folder Structure Exports
export '../data/export.dart';
export '../domain/export.dart';
export '../presentation/export.dart';

//* Utils Extensions Exports
export 'extensions/text.dart';

//* Utils Router Exports
export 'router/generator.dart';
export 'router/name.dart';
export 'router/screen_transition.dart';

//* Utils Exports
export 'colors.dart';
export 'helpers.dart';
export 'validation.dart';
export 'use_case.dart';

//* Third Party Exports
export 'package:go_router/go_router.dart';
export 'package:bloc/bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_auth/firebase_auth.dart' hide User;
export 'package:cloud_firestore/cloud_firestore.dart' hide kIsWasm;
export 'package:flutter_svg/flutter_svg.dart';
export 'package:fluttertoast/fluttertoast.dart';
export 'package:google_sign_in/google_sign_in.dart';
export 'package:flutter_dotenv/flutter_dotenv.dart';
export 'package:github_oauth/github_oauth.dart';
export 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
export 'package:local_auth/local_auth.dart';
