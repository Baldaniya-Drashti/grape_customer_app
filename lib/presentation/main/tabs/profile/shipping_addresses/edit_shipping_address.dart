// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grape_customer_app/application/main/profile/edit_profile/edit_profile_bloc.dart';
// import 'package:grape_customer_app/application/main/profile/shipping_addresses/edit_shipping_addresses/edit_shipping_addresses_bloc.dart';
// import 'package:grape_customer_app/domain/core/l10n/app_localizations.dart';
// import 'package:grape_customer_app/presentation/core/widgets/inputs/custom_text_field.dart';

// @RoutePage(name: 'EditShippingAddresses')
// class EditShippingAddress extends StatelessWidget {
//   const EditShippingAddress({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => Shipp(),
//       child: BlocBuilder<EditShippingAddressesBloc, EditShippingAddressesState>(
//         builder: (context, state) {
//           return Scaffold(
//             body: CustomTextField(
//               labelText: AppLocalizations.of(context).fullName,
//               hintText: AppLocalizations.of(context).fullName,
//               onChanged: (fullName) => context
//                   .read<EditShippingAddressesBloc>()
//                   .add(EditShippingAddressesEvent.fullNameChanged(fullName)),
//               validator: (p0, p1) => context
//                   .read<EditShippingAddressesBloc>()
//                   .state
//                   .fullName
//                   .value
//                   .fold(
//                       (l) => l.maybeMap(
//                             empty: (value) =>
//                                 AppLocalizations.of(context).enterFullName,
//                             invalidUsername: (value) =>
//                                 AppLocalizations.of(context).enterFullName,
//                             orElse: () => null,
//                           ),
//                       (r) => null),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
