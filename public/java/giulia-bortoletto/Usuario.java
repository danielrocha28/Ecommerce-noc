package school.sptech;

import java.util.Locale;
import java.util.Scanner;

public class Usuario {
    String nome;
    String email;
    String senha;
    String empresa;
    String cargo;

    void cadastro() {
        Scanner leitor = new Scanner(System.in);
        String senhaInformada = "";

        System.out.println("""
                 ------ Area de Cadastro ------
                Bem vindo/a a área de cadastro!
                Por favor informe os dados a seguir...
                """);
        System.out.println("Informe o seu nome: ");
        nome = leitor.nextLine();
        System.out.println("Informe o seu email: ");
        email = leitor.nextLine();

        while (true) {
            Boolean erros = false;
            System.out.println("Informe a senha que gostaria de utilizar: ");
            senhaInformada = leitor.nextLine();

            if(senhaInformada.length() < 6) {
                System.out.println("A sua senha precisa de no minimo 6 caracteres");
                erros = true;

            } if (!senhaInformada.contains("@") &&
                    !senhaInformada.contains("!") &&
                    !senhaInformada.contains("#") &&
                    !senhaInformada.contains("*") &&
                    !senhaInformada.contains("%")){

                System.out.println("A senha deve conter pelo menos um caractere especial.");
                erros = true;

            }
            if(!erros) {
                senha = senhaInformada;
                break;
            }
        }

        System.out.println("Informe o nome da sua Empresa: ");
        empresa = leitor.nextLine().toLowerCase(Locale.ROOT);
        System.out.println("Informe o seu cargo: ");
        cargo = leitor.nextLine().toLowerCase(Locale.ROOT);

        System.out.println("Cadastro Realizado com sucesso! ");
        exibirDados();
    }

    void exibirDados() {
        System.out.printf("""
              ------ Dados do Usuário ------
              nome: %s
              email: %s
              senha: %s
              empresa: %s
              cargo: %s \n""",nome,email,senha,empresa,cargo);
    }

    void login(String emailInformado, String senhaInformada) {

        if (!emailInformado.equals(email)) {
            System.out.println("O email informado não existe!");
            return;
        }

        if (!senhaInformada.equals(senha)) {
            System.out.println("A senha está incorreta!");
            return;
        }

        System.out.println("O login foi realizado com sucesso!\n");
        exibirDados();
    }
}
