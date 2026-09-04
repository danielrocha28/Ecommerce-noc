import dotenv from "dotenv";
import nodemailer from "nodemailer";

dotenv.config({ path: ".env.dev" });

dotenv.config({ path: ".env.dev" });
const transporter = nodemailer.createTransport({
    host: process.env.EMAIL_SMTP_HOST,
    port: process.env.EMAIL_SMTP_PORT,
    auth: {
        user: process.env.EMAIL_SMTP_USER,
        pass: process.env.EMAIL_SMTP_PASSWORD,
    },
    secure: false
})


async function send() {
    await transporter.sendMail({
      from: process.env.EMAIL_SMTP_USER,
      to: "alguem",
      subject: "subtitulo",
      text: "texto"
    })
}


send()
  .then(() => console.log("E-mail enviado!"))
  .catch((err) => console.error("Erro ao enviar:", err));

const email = {
    send
}

export default email