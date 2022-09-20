import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

class AuthFirebaseService implements AuthService {
  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signUp(String email, String password) async {
    final auth = FirebaseAuth.instance;

    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if (credential.user == null) return;

    // Salvar no Banco de Dados NOSQL (Não relacional)
    _saveMovieUser;
  }

  Future<void> _saveMovieUser(User user) async {
    final store = FirebaseFirestore.instance;

    final docRef = store.collection('users').doc(user.uid);

    return docRef.set({
      'email': user.email,
    });
  }

  @override
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
