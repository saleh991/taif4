abstract class ProfileState {}

class ProfileInitState extends ProfileState{}

class ProfileLoadingState extends ProfileState{}

class ProfileSuccessState extends ProfileState{}

class ProfileErrorState extends ProfileState{}

class EditProfileLoadingState extends ProfileState{}

class EditProfileSuccessState extends ProfileState{}

class EditProfileErrorState extends ProfileState{}
class LogoutState extends ProfileState{}

class PackagesIdLoadingState extends ProfileState{}

class PackagesIdSuccessState extends ProfileState{}

class PackagesIdErrorState extends ProfileState{}

class ChangePasswordState extends ProfileState{}

class ChangePasswordVisibilityState extends ProfileState{}
