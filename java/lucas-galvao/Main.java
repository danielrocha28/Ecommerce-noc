package school.sptech;

import java.util.Scanner;

public class Main {
    static String nomeUsuario;
    static String emailUsuario;
    static String senhaUsuario;
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        int opcao = 0;
        
        while (opcao != 3) {
            
            System.out.println("\n=== EcomCore ===");
            System.out.println("1 - Logar");
            System.out.println("2 - Cadastrar");
            System.out.println("3 - Sair");
            System.out.print("Escolha uma opção: ");
            
            opcao = scanner.nextInt();
            scanner.nextLine();
            
            if (opcao == 1) {
                login(scanner);
            } else if (opcao == 2) {
                cadastrar(scanner);
                
            } else if (opcao == 3) {
                System.out.println("\nSaindo do EcomCore...");
                
            } else {
                System.out.println("\nOpção inválida.");
            }
        }
        scanner.close();
    }
    
    public static void cadastrar(Scanner scanner) {
        System.out.println("\n=== Cadastro ===");
        
        System.out.print("Digite seu nome: ");
        nomeUsuario = scanner.nextLine();
        
        System.out.print("Digite seu e-mail: ");
        emailUsuario = scanner.nextLine();
        
        while (!emailUsuario.contains("@") || !emailUsuario.contains(".com")) {
            System.out.println("E-mail inválido! O e-mail deve conter @ e .com.");
            
            System.out.print("Digite seu e-mail novamente: ");
            emailUsuario = scanner.nextLine();
        }
        System.out.println("E-mail válido!");
        
        System.out.print("Digite sua senha: ");
        senhaUsuario = scanner.nextLine();
        
        boolean temNumero = false;
        
        for (int i = 0; i < senhaUsuario.length(); i++) {
            if (Character.isDigit(senhaUsuario.charAt(i))) {
                temNumero = true;
                break;
            }
        }
        
        while (senhaUsuario.length() < 6 || !temNumero) {
            System.out.println("Senha inválida!");
            System.out.println("A senha deve ter pelo menos 6 caracteres e 1 número.");
            
            System.out.print("Digite sua senha novamente: ");
            senhaUsuario = scanner.nextLine();
            
            temNumero = false;
            for (int i = 0; i < senhaUsuario.length(); i++) {
                if (Character.isDigit(senhaUsuario.charAt(i))) {
                    temNumero = true;
                    break;
                }
            }
        }
        System.out.println("Senha válida!");
        
        System.out.println("\nCadastro realizado com sucesso!");
    }
    
    public static void login(Scanner scanner) {
        if (emailUsuario == null || senhaUsuario == null) {
            System.out.println("\nNenhum usuário cadastrado.");
            System.out.println("Faça o cadastro primeiro.");
            return;
        }
        
        System.out.println("\n=== Login ===");
        
        System.out.print("Digite seu e-mail: ");
        String emailLogin = scanner.nextLine();
        
        System.out.print("Digite sua senha: ");
        String senhaLogin = scanner.nextLine();
        
        if (emailLogin.equals(emailUsuario) && senhaLogin.equals(senhaUsuario)) {
            System.out.println("\nBem-vindo " + nomeUsuario
                    + " a EcomCore, onde o seu sistema fala e a gente escuta");
        } else {
            System.out.println("\nE-mail ou senha incorretos.");
        }
    }
}