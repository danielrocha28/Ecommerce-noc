package school.sptech;
import java.util.Scanner;
public class Cadastro {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String resposta;

        do {
            System.out.println("Digite seu nome: ");
            String nome = scanner.nextLine();

            System.out.println("Digite seu email: ");
            String email = scanner.nextLine();

            System.out.println("Digite seu cargo: ");
            String cargo = scanner.nextLine();

            System.out.println("Digite sua senha: ");
            String senha = scanner.nextLine();

            System.out.printf("""
                    Nome: %s
                    Email: %s
                    Cargo: %s
                    Senha: %s
                    """, nome, email, cargo, senha);

            System.out.println("Deseja realizar outro cadastro? (Sim/Nao)");
            resposta = scanner.nextLine();


        } while (resposta.equals("Sim"));
        System.out.println("Programa encerrado!!");
    }
}