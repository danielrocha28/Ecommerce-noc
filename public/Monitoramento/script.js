async function atualizarDados() {

    const status = document.getElementById("status");

    status.textContent = "Coletando dados...";

    try {

        const resposta = await fetch("/dados");

        if (!resposta.ok) {
            throw new Error("Erro HTTP: " + resposta.status);
        }

        const dados = await resposta.json();

        document.getElementById("cpu").textContent =
            dados.cpu_percent + "%";

        document.getElementById("cpu-count").textContent =
            dados.cpu_count;

        document.getElementById("cpu-freq").textContent =
            dados.cpu_freq + " MHz";

        document.getElementById("memoria-percent").textContent =
            dados.memoria_percent + "%";

        document.getElementById("memoria-used").textContent =
            dados.memoria_used + " GB";

        document.getElementById("memoria-total").textContent =
            dados.memoria_total + " GB";

        document.getElementById("disco-used").textContent =
            dados.disco_used + " GB";

        document.getElementById("disco-free").textContent =
            dados.disco_free + " GB";

        document.getElementById("disco-total").textContent =
            dados.disco_total + " GB";

        document.getElementById("bytes-recebidos").textContent =
            dados.bytes_recebidos + " Mb";
        document.getElementById("bytes-enviados").textContent =
            dados.bytes_enviados + " Mb";
        document.getElementById("mbps-total").textContent =
            dados.mbps_total + " MBPS";
        status.textContent = "Dados atualizados com sucesso!";

    } catch (erro) {

        console.error(erro);

        status.textContent =
            "Erro ao obter os dados do computador.";
    }
    setTimeout(atualizarDados(), 2000)
}
