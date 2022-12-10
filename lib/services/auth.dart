List<String> admin_emails = ['', 'admin@rmp.com'];
List<String> admin_password = ['','1234'];
List<String> user_emails = ['iligan_branch1@rmp.com','iligan_branch2@rmp.com','kapatagan_branch@rmp.com','maranding_branch@rmp.com','aurora_branch@rmp.com'];
List<String> user_password = ['1234','1234','1234','1234','1234','1234'];
List<String> user_name = ['Iligan 1','Iligan 2','Kapatagan','Maranding','Aurora'];
List<String> branch_loc = ['Iligan', 'Iligan', 'Kapatagan','Maranding','Aurora'];

class AuthService{
  Map<String,String> signIn(String emailAddress, String password, String session, String branch) {
    Map<String,String> credential = {};
    if(session == 'admin'){
      int elem = 0;
      bool isFound = false;
      for(elem = 0; elem < admin_emails.length; elem++){
        if(admin_emails.elementAt(elem) == emailAddress){
          isFound = true;
          break;
        }
      }
      if(isFound && (admin_password.elementAt(elem) == password)){
        credential = {'admin':'Admin'};
        print('correct credentials');
      }else{
        print('wrong credentials');
      }
    }else if(session == 'user'){
      int elem = 0;
      bool isFound = false;
      for(elem = 0; elem < user_emails.length; elem++){
        if(user_emails.elementAt(elem) == emailAddress){
          isFound = true;
          break;
        }
      }
      if(isFound && (user_password.elementAt(elem) == password)  && branch == branch_loc.elementAt(elem)){
        credential = {'user':user_name.elementAt(elem)};
        print('correct credentials');
      }else{
        print('wrong credentials');
      }
    }
    return credential;
  }

  // signOut() {
  //
  // }
  
}