# Sincronizar no GitHub

Eu não consigo dar push na sua conta (é preciso a sua autenticação). O repositório já
está **pronto e commitado** — escolha um dos caminhos abaixo. Todos terminam com o
projeto no seu GitHub, pronto pra ligar no EasyPanel.

---

## Caminho 1 — Bundle pronto (mais rápido, preserva o commit)

Use o arquivo `profluiz-repo.bundle`. Ele é o repositório com o commit já feito.

1. Crie um repositório **vazio** no GitHub (sem README), ex: `profluiz-link`
2. No terminal:

```bash
git clone profluiz-repo.bundle profluiz-link
cd profluiz-link
git remote set-url origin https://github.com/SEU-USUARIO/profluiz-link.git
git push -u origin main
```

Na hora do push, o GitHub pede login. Use um **Personal Access Token** como senha
(GitHub → Settings → Developer settings → Tokens). O token é seu — não compartilhe.

---

## Caminho 2 — Do zero com os arquivos (zip)

Se preferir montar você mesmo, use o conteúdo do `profluiz-easypanel.zip`.

1. Descompacte o zip numa pasta
2. Crie o repositório vazio no GitHub (`profluiz-link`)
3. No terminal, dentro da pasta:

```bash
git init
git add .
git commit -m "Link in bio - Prof. Dr. Luiz Junior"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/profluiz-link.git
git push -u origin main
```

---

## Caminho 3 — Pelo site do GitHub (sem terminal)

1. Crie o repositório `profluiz-link` no GitHub
2. Clique em **uploading an existing file**
3. Arraste os arquivos do zip: `Dockerfile`, `nginx.conf`, `.dockerignore`,
   e a pasta `public/` (com `index.html`, `avatar.png`, `profluiz-video.mp4`)
4. **Commit changes**

O vídeo está com **18,6 MB** — abaixo do limite de 25 MB do upload pelo navegador,
então passa sem problema.

---

## Depois: ligar no EasyPanel

Com o repo no GitHub:

1. EasyPanel → **+ Service → App**
2. **Source → GitHub** → selecione `profluiz-link`, branch `main`
3. **Build → Dockerfile**
4. **Deploy**
5. **Domains → Add Domain** → seu subdomínio → aponte o DNS (registro A) pro IP da VPS → SSL automático
6. Porta do container: **80**

Pra atualizar depois: edite os arquivos, `git push`, e o EasyPanel refaz o deploy
(ative o deploy automático no serviço, se quiser).
