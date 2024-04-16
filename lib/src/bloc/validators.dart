import 'dart:async';

mixin  Validators{
  final ValidaEmail = 
  StreamTransformer<String, String>
  .fromHandlers(
    handleData: (email, sink){
      if(email.contains('@')){
        sink.add(email);
      }else{
        sink.addError('Email Invalido');
      }
    }
  );
  final ValidaPassword = 
  StreamTransformer<String, String>
  .fromHandlers(
    handleData: (password, sink){
      if(password.length>=5){
        sink.add(password);
      }else{
        sink.addError('Password Invalido');
      }
    }
  );
}
