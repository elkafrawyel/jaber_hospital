part of 'ContactUsImports.dart';

String urlImage =
    'https://img.freepik.com/free-photo/milford-sound-new-zealand-travel-destination-concept_53876-42945.jpg?w=2000';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final ContactUsData contactUsData = new ContactUsData();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocConsumer<LocationCubit, LocationState>(
          bloc: contactUsData.locationCubit,
          listener: (context, state) {
            contactUsData.address.text = state.model?.address ?? "";
          },
          builder: (context, state) {
            return GenericTextField(
              fieldTypes: FieldTypes.clickable,
              label: "location",
              controller: contactUsData.address,
              validate: (value) => value!.validateEmpty(context),
              type: TextInputType.text,
              action: TextInputAction.done,
              onTab: () => contactUsData.onLocationClick(context),
              // onSubmit: () => loginData.userLogin(context),
            );
          },
        ),

      ],
    );
  }
}

//
// class Dismssable extends StatefulWidget {
//   const Dismssable({Key? key}) : super(key: key);
//
//   @override
//   State<Dismssable> createState() => _DismssableState();
// }
//
// class _DismssableState extends State<Dismssable> {
//   @override
//   Widget build(BuildContext context) {
//     return DismissiblePage(
//
//
//       backgroundColor: Colors.transparent,
//       dragSensitivity: 1.5,
//
//       onDismissed: () {
//         Navigator.of(context).pop();
//       },
//       // Note that scrollable widget inside DismissiblePage might limit the functionality
//       // If scroll direction matches DismissiblePage direction
//       direction: DismissiblePageDismissDirection.multi,
//       isFullScreen: false,
//       child: Hero(
//         tag: "image${urlImage}",
//         child: Container(
//           child: Image.network(
//             urlImage,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
