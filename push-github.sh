#!/bin/bash

# ============================================
# SCRIPT DE PUSH PRO GITHUB
# ============================================
# CUSTOMIZE ANTES DE RODAR:

GITHUB_USER="SEU_USUARIO_GITHUB"  # ex: francisco-sx
REPO_NAME="profluiz-link"         # ex: profluiz-link
BRANCH="main"

# ============================================

if [ "$GITHUB_USER" = "SEU_USUARIO_GITHUB" ]; then
    echo "❌ ERRO: Customize o GITHUB_USER no script!"
    echo "Abra este arquivo e troque 'SEU_USUARIO_GITHUB' pelo seu usuário"
    exit 1
fi

cd "$(dirname "$0")" || exit 1

echo "🔧 Configurando repo..."
git config user.email "deploy@sevenxperts" 2>/dev/null
git config user.name "Seven Xperts" 2>/dev/null

REPO_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"

echo "📦 Remote: $REPO_URL"
git remote get-url origin 2>/dev/null && git remote remove origin
git remote add origin "$REPO_URL"

echo "🚀 Push pra $BRANCH..."
git push -u origin "$BRANCH" --force

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ SUCESSO!"
    echo "🌐 Seu repo está em: $REPO_URL"
    echo "📋 Próximo passo: EasyPanel → + Service → Source: GitHub"
else
    echo "❌ Push falhou. Verifique:"
    echo "  • GITHUB_USER está correto?"
    echo "  • GitHub autenticado (SSH ou token)?"
    exit 1
fi
