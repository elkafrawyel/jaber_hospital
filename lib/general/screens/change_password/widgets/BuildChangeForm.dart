part of 'ChangePassWidgetsImports.dart';

class BuildChangeForm extends StatelessWidget {
  final ChangePasswordData changePasswordData;

  const BuildChangeForm({required this.changePasswordData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: changePasswordData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: 'Current Password',
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: changePasswordData.showCurrentPassBloc,
            builder: (context, state) {
              return GenericTextField(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                fillColor: MyColors.textFields,
                fieldTypes:
                state.data ? FieldTypes.password : FieldTypes.normal,
                controller: changePasswordData.oldPassword,
                margin: const EdgeInsets.symmetric(vertical: 10),
                type: TextInputType.visiblePassword,
                validate: (value) => value!.validatePassword(context),
                action: TextInputAction.next,
                suffixIcon: InkWell(
                    onTap: () {
                      changePasswordData.showCurrentPassBloc
                          .onUpdateData(!state.data);
                    },
                    child: Container(
                      child: state.data
                          ? Icon(
                        Icons.visibility_outlined,
                        size: 20,
                      )
                          : Icon(
                        Icons.visibility_off_outlined,
                        size: 20,
                      ),
                    )),
              );
            },
          ),
          MyText(
            title: 'New Password',
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: changePasswordData.showNewPassBloc,
            builder: (context, state) {
              return GenericTextField(
                fillColor: MyColors.textFields,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                fieldTypes:
                state.data ? FieldTypes.password : FieldTypes.normal,
                controller: changePasswordData.newPassword,
                margin: const EdgeInsets.symmetric(vertical: 10),
                type: TextInputType.visiblePassword,
                validate: (value) => value!.validatePassword(context),
                action: TextInputAction.next,
                suffixIcon: InkWell(
                    onTap: () {
                      changePasswordData.showNewPassBloc
                          .onUpdateData(!state.data);
                    },
                    child: Container(
                      child: state.data
                          ? Icon(Icons.visibility_outlined, size: 20)
                          : Icon(Icons.visibility_off_outlined, size: 20),
                    )),
              );
            },
          ),
          MyText(
            title: 'Confirm New Password',
            size: 10,
            fontWeight: FontWeight.bold,
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: changePasswordData.showConfirmNewPassBloc,
            builder: (context, state) {
              return GenericTextField(
                fillColor: MyColors.textFields,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                fieldTypes:
                state.data ? FieldTypes.password : FieldTypes.normal,
                controller: changePasswordData.confirmNewPassword,
                margin: const EdgeInsets.symmetric(vertical: 10),
                type: TextInputType.visiblePassword,
                validate: (value) => value!.validatePasswordConfirm(context,
                    pass: changePasswordData.newPassword.text),
                action: TextInputAction.done,
                suffixIcon: InkWell(
                    onTap: () {
                      changePasswordData.showConfirmNewPassBloc
                          .onUpdateData(!state.data);
                    },
                    child: Container(
                      child: state.data
                          ? Icon(Icons.visibility_outlined, size: 20)
                          : Icon(Icons.visibility_off_outlined, size: 20),
                    )),
                // onSubmit: () => changePasswordData.setChangePassword(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
