# WhatsApp "Estilo Windows" para Linux 🐧🪟

Cansado de ter que deixar uma aba do navegador aberta o dia todo só para o WhatsApp? Eu também. Por isso, criei este script para trazer a experiência oficial do Windows para o nosso querido Linux.

## 🤔 Por que fiz isso?

Existem vários apps por aí, mas nenhum me entregava exatamente o que eu queria: um app que parece **nativo**, que fica escondidinho na **tray (perto do relógio)**, que abre sozinho quando ligo o PC e que não trava por causa de frescuras de driver de vídeo. 

Esse script resolve tudo isso de uma vez só: ele cria um "container" (Electron) seguro direto do site oficial do WhatsApp.

## ✨ O que ele faz de diferente?

- **Tray Real**: Fechou a janela? Ele continua lá no cantinho, pronto para te avisar de novas mensagens.
- **Visual Windows 11**: Injeta um CSS esperto para deixar a cara do app mais moderna e limpa.
- **Sem Frescura**: Já configurei as flags necessárias (`--no-sandbox` e `--disable-gpu`) para que ele abra de primeira em qualquer distro.
- **Auto-start**: Ele se configura sozinho para iniciar com o sistema.

## � Como usar no seu PC

É bem simples, só precisa ter o `node.js` e o `npm` instalados:

1. Baixe os arquivos deste projeto.
2. Abra o terminal na pasta e execute:
   ```bash
   chmod +x install_whatsapp.sh
   ./install_whatsapp.sh
   ```
3. Pronto! Procure por "WhatsApp" no seu menu de aplicativos.

## 🤝 Bora melhorar?

Fez um CSS mais bonito? Achou um jeito melhor de integrar as notificações? Abre um Pull Request aí! O código é nosso.

---
*Criado com ❤️ por quem prefere Linux, mas sente falta da praticidade do Windows.*
