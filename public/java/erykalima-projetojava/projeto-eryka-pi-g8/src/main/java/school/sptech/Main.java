package school.sptech;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        Login sistema = new Login();

        int opcao;

        do {
            System.out.println("""
                    
                    ===== SISTEMA =====
                    1 - Cadastrar
                    2 - Login
                    3 - Sair
                    """);

            System.out.print("Escolha uma opção: ");
            opcao = sc.nextInt();
            sc.nextLine();

            if (opcao == 1) {

                Cadastro cadastro = new Cadastro();

                System.out.println("\n===== CADASTRO =====");

                System.out.print("Nome: ");
                cadastro.setNome(sc.nextLine());

                System.out.print("E-mail: ");
                cadastro.setEmail(sc.nextLine());

                System.out.print("Contato: ");
                cadastro.setContato(sc.nextInt());
                sc.nextLine();

                System.out.print("Senha: ");
                cadastro.setSenha(sc.nextLine());

                System.out.print("Empresa: ");
                cadastro.setEmpresa(sc.nextLine());

                System.out.print("Cargo: ");
                cadastro.setCargo(sc.nextLine());

                sistema.cadastrar(cadastro);

                System.out.println("\nCadastro realizado com sucesso!");

            } else if (opcao == 2) {

                System.out.println("\n===== LOGIN =====");

                System.out.print("E-mail: ");
                String email = sc.nextLine();

                System.out.print("Senha: ");
                String senha = sc.nextLine();

                Cadastro usuario = sistema.fazerLogin(email, senha);

                if (usuario != null) {

                    System.out.println("\nLogin realizado com sucesso!");
                    System.out.println("Bem-vindo(a), " + usuario.getNome() + "!");

                } else {

                    System.out.println("\nE-mail ou senha incorretos.");
                }

            } else if (opcao == 3) {

                System.out.println("Encerrando sistema...");

            } else {

                System.out.println("Opção inválida.");
            }

        } while (opcao != 3);

        sc.close();
    }
}
