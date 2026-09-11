import java.util.Scanner;

// Classe responsável por agrupar as regras de negócio e cálculos financeiros
class CalculadoraFinanceira {

    private double faturamentoMensal;
    private double horasInatividadeMes;
    private int carrinhosAbandonadosLentidao;
    private double ticketMedio;


    public CalculadoraFinanceira(double faturamentoMensal, double horasInatividadeMes, int carrinhosAbandonadosLentidao, double ticketMedio) {
        this.faturamentoMensal = faturamentoMensal;
        this.horasInatividadeMes = horasInatividadeMes;
        this.carrinhosAbandonadosLentidao = carrinhosAbandonadosLentidao;
        this.ticketMedio = ticketMedio;
    }

    public double calcularPrejuizoInatividade() {

        double faturamentoPorHora = faturamentoMensal / 720;
        return faturamentoPorHora * horasInatividadeMes;
    }

    public double calcularPrejuizoLentidao() {
        return carrinhosAbandonadosLentidao * ticketMedio;
    }

    public double calcularPrejuizoTotal() {
        return calcularPrejuizoInatividade() + calcularPrejuizoLentidao();
    }

    public double simularEconomiaComMonitoramento(double taxaDeEficiencia) {
        return calcularPrejuizoTotal() * (taxaDeEficiencia / 100);
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);

        System.out.println("==========================================================");
        System.out.println("   CALCULADORA DE IMPACTO FINANCEIRO - INFRAESTRUTURA IT  ");
        System.out.println("==========================================================\n");

        System.out.print("1. Qual o faturamento mensal projetado do e-commerce (R$)? ");
        double faturamento = leitor.nextDouble();

        System.out.print("2. Quantas horas por mês o site costuma ficar fora do ar por sobrecarga? ");
        double horasInativas = leitor.nextDouble();

        System.out.print("3. Quantos carrinhos são abandonados por mês devido a lentidão nas páginas? ");
        int carrinhos = leitor.nextInt();

        System.out.print("4. Qual o Ticket Médio (valor médio gasto por cliente em R$)? ");
        double ticket = leitor.nextDouble();
        CalculadoraFinanceira simulador = new CalculadoraFinanceira(faturamento, horasInativas, carrinhos, ticket);

        double perdaQuedas = simulador.calcularPrejuizoInatividade();
        double perdaLentidao = simulador.calcularPrejuizoLentidao();
        double perdaTotal = simulador.calcularPrejuizoTotal();

        double valorSalvo = simulador.simularEconomiaComMonitoramento(85.0);

        System.out.println("\n==========================================================");
        System.out.println("                   RELATÓRIO DE IMPACTO                   ");
        System.out.println("==========================================================");
        System.out.printf("Prejuízo estimado por Inatividade (Servidor Down): R$ %.2f\n", perdaQuedas);
        System.out.printf("Prejuízo estimado por Lentidão (Abandono de Carrinho): R$ %.2f\n", perdaLentidao);
        System.out.printf("Impacto Financeiro Negativo TOTAL: R$ %.2f\n", perdaTotal);
        System.out.println("----------------------------------------------------------");
        System.out.printf("Com o sistema de Monitoramento EcomCore atuando\n");
        System.out.printf("a empresa deixaria de perder aproximadamente: R$ %.2f ao mês!\n", valorSalvo);
        System.out.println("==========================================================");

        leitor.close();
    }
}