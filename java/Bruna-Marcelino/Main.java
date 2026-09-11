package school.sptech;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.println("Cadastro de usuario EcomCore!");

System.out.print("Digite o nome: ");
        String nome = sc.nextLine();

 System.out.print("Digite o e-mail: ");
        String email = sc.nextLine();

System.out.print("Digite a senha: ");
        String senha = sc.nextLine();

System.out.print("Digite o cargo: ");
        String cargo = sc.nextLine();


        LocalDateTime dataHora = LocalDateTime.now();

   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
   String dataHoraFormatada = dataHora.format(formatter);

        System.out.println();
        System.out.println("Usuário " + nome + " cadastrado com sucesso!");
        System.out.println("Data e hora do cadastro: " + dataHoraFormatada);

        sc.close();
    }
}

