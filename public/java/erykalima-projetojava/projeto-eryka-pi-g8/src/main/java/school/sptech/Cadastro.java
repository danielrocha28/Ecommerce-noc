package school.sptech;

public class Cadastro {

    private String nome;
    private String email;
    private Integer contato;
    private String senha;
    private String empresa;
    private String cargo;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getContato() {
        return contato;
    }

    public void setContato(Integer contato) {
        this.contato = contato;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public void exibirCadastro() {
        System.out.printf("""
                --------------------------
                Nome: %s
                E-mail: %s
                Contato: %d
                Empresa: %s
                Cargo: %s
                ---------------------------
                """,
                nome, email, contato, empresa, cargo
        );
    }
}
