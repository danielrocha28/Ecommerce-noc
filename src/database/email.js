import dotenv from "dotenv";
import nodemailer from "nodemailer";

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

async function send(to, subject, text) {
    try {
        await transporter.sendMail({
            from: process.env.EMAIL_SMTP_USER,
            to,
            subject,
            text
        });
        console.log(`E-mail enviado com sucesso para: ${to}`);
    } catch (err) {
        console.error(`Erro ao enviar e-mail para ${to}:`, err);
        throw err;
    }
}

const email = {
    send
}

export default email