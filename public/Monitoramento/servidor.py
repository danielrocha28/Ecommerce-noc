from http.server import HTTPServer, SimpleHTTPRequestHandler
import json
import psutil as p


def coletar_dados():

    uso_cpu = p.cpu_percent(interval=0.5)

    cpu_count = p.cpu_count(logical=False)

    cpu_freq = p.cpu_freq()
    frequencia = round(cpu_freq.current, 2) if cpu_freq else 0

    memoria = p.virtual_memory()

    memoria_percent = memoria.percent
    memoria_total = round(memoria.total / (1024 ** 3), 2)
    memoria_used = round(memoria.used / (1024 ** 3), 2)

    disco = p.disk_usage("/")

    disco_total = round(disco.total / (1024 ** 3), 2)
    disco_used = round(disco.used / (1024 ** 3), 2)
    disco_free = round(disco.free / (1024 ** 3), 2)

    bytes_recebidos = round((p.net_io_counters().bytes_recv / pow(1024,2)),2)
    bytes_enviados = round((p.net_io_counters().bytes_sent / pow(1024,2)),2)
    mbps_total = round((bytes_recebidos - bytes_enviados), 2)

    return {
        "cpu_percent": uso_cpu,
        "cpu_count": cpu_count,
        "cpu_freq": frequencia,
        "memoria_percent": memoria_percent,
        "memoria_total": memoria_total,
        "memoria_used": memoria_used,
        "disco_total": disco_total,
        "disco_used": disco_used,
        "disco_free": disco_free,
        "bytes_recebidos": bytes_recebidos,
        "bytes_enviados": bytes_enviados,
        "mbps_total": mbps_total
    }


class Servidor(SimpleHTTPRequestHandler):

    def do_GET(self):

        if self.path == "/dados":

            dados = coletar_dados()

            resposta = json.dumps(dados).encode("utf-8")

            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Content-Length", str(len(resposta)))
            self.end_headers()

            self.wfile.write(resposta)

        else:
            super().do_GET()


servidor = HTTPServer(("localhost", 8000), Servidor)

print("Servidor iniciado!")
print("Acesse http://localhost:8000")

servidor.serve_forever()
