# Deploy no EasyPanel — Link do Prof. Dr. Luiz Júnior

Estrutura do pacote:

```
deploy/
├── Dockerfile
├── nginx.conf
├── .dockerignore
└── public/
    ├── index.html
    ├── avatar.png
    └── profluiz-video.mp4
```

Você tem 2 caminhos. O **Caminho A (GitHub)** é o recomendado — depois é só dar `git push` pra atualizar o site.

---

## CAMINHO A — Via GitHub (recomendado)

### 1. Suba a pasta pro GitHub
Crie um repositório novo (ex: `profluiz-link`) e envie o conteúdo da pasta `deploy/`
(o `Dockerfile` tem que ficar na raiz do repo, com a pasta `public/` do lado).

```bash
cd deploy
git init
git add .
git commit -m "Link in bio Prof. Luiz"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/profluiz-link.git
git push -u origin main
```

### 2. No EasyPanel
1. Abra seu projeto (ou crie um novo) → **+ Service** → **App**
2. Dê um nome (ex: `profluiz`)
3. Na aba **Source**, escolha **GitHub** e selecione o repositório `profluiz-link`, branch `main`
4. Na aba **Build**, selecione **Dockerfile** (o EasyPanel detecta sozinho)
5. Clique em **Deploy**

### 3. Domínio
1. Na aba **Domains** do serviço → **Add Domain**
2. Coloque o domínio/subdomínio (ex: `drluizjr.sevenxperts.solutions`)
3. Aponte o DNS desse domínio pro IP da sua VPS (registro **A**)
4. O EasyPanel gera o **SSL (HTTPS) automático** via Let's Encrypt
5. Confirme que a porta interna está **80**

Pronto. Pra atualizar qualquer coisa depois: edite os arquivos, `git push`, e clique em **Deploy** (ou ative o deploy automático).

---

## CAMINHO B — Upload direto (sem GitHub)

Se não quiser usar GitHub:

1. Compacte a pasta `deploy/` num `.zip`
2. No EasyPanel: **+ Service → App → Source → Upload** (ou "Git"/"Tarball" conforme sua versão)
3. Envie o zip, selecione build por **Dockerfile**, **Deploy**
4. Configure o domínio igual ao passo 3 acima

---

## Observações técnicas

- **Porta:** o container expõe a **80** (nginx). No EasyPanel deixe a porta de container como `80`.
- **Vídeo:** o `nginx.conf` já habilita *range requests* (`Accept-Ranges`), então o vídeo faz streaming/seek liso, sem baixar tudo de uma vez.
- **Vídeo pesado (~27 MB):** está em 1080×1350. Se quiser carregamento ainda mais rápido no 4G, dá pra gerar uma versão mais leve — é só pedir.
- **Autoplay:** o vídeo roda em loop, começa sozinho e **mudo** (regra dos navegadores). O usuário clica no ícone de som pra ouvir.
- **Trocar conteúdo depois:** tudo que aparece na página está em `public/index.html` (textos e links) — fácil de editar.
