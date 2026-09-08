package school.sptech;

import java.util.ArrayList;
import java.util.List;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    static void main() {
        List<Usuario> usuarios = new ArrayList<>();

        Usuario usuario1 = new Usuario();

        usuario1.nome = "Penelope";
        usuario1.email = "penelope@123";
        usuario1.senha = "123456!";
        usuario1.empresa = "EcomCore";
        usuario1.cargo = "Analista";

        usuarios.add(usuario1);

        Usuario novoUsuario = new Usuario();
        novoUsuario.cadastro();
        usuarios.add(novoUsuario);

        System.out.println("\n Quantidade de usuarios cadastrados: " + usuarios.size());

        usuario1.login("penelope@123","123456!");

    }
}
