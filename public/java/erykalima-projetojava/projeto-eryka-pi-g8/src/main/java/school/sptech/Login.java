package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class Login {

    private List<Cadastro> cadastros = new ArrayList<>();

    public void cadastrar(Cadastro cadastro) {
        cadastros.add(cadastro);
    }

    public Cadastro fazerLogin(String email, String senha) {

        for (Cadastro cadastro : cadastros) {

            if (cadastro.getEmail().equals(email)
                    && cadastro.getSenha().equals(senha)) {

                return cadastro;
            }
        }

        return null;
    }

    public int getQntCadastros() {
        return cadastros.size();
    }
}
