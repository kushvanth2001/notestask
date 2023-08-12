class UserModel{
final String email;
final String password;
final String username;
final List<String> list=[];
final List<String> titlelist=[];
final List<String> dateofcreation=[];

  UserModel({required this.email, required this.password,required this.username});
    Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'username': username,
      'list': list,
      'titlelist':titlelist,
      'dateofcreation':dateofcreation
    };
  }

}