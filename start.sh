#!/bin/bash
# ==========================================
# QBRETE WEBSITE — Quick Start Server
# ==========================================
# Propósito: Iniciar servidor HTTP local automáticamente
# Compatible: macOS, Linux
# Requisitos: Python 3 o PHP instalado
# Uso: ./start.sh (desde terminal en la carpeta raíz)
# ==========================================

echo "🚀 Iniciando servidor Qbrete..."
echo ""

# PASO 1: Verificar si Python 3 está disponible
# Python es preferido porque es más común y rápido
if command -v python3 &> /dev/null; then
    echo "✅ Usando Python 3 HTTP Server"
    echo "📁 Servidor abierto: http://localhost:8080"
    echo "   Presiona Ctrl+C para detener"
    echo ""
    
    # Abrir navegador automáticamente
    # macOS: open, Linux: xdg-open
    open "http://localhost:8080" 2>/dev/null || xdg-open "http://localhost:8080" 2>/dev/null
    
    # Iniciar servidor en puerto 8080
    python3 -m http.server 8080

# PASO 2: Si Python no está disponible, intentar con PHP
elif command -v php &> /dev/null; then
    echo "✅ Usando PHP Built-in Server"
    echo "📁 Servidor abierto: http://localhost:8080"
    echo "   Presiona Ctrl+C para detener"
    echo ""
    
    # Abrir navegador automáticamente (macOS)
    open "http://localhost:8080" 2>/dev/null
    
    # Iniciar servidor en puerto 8080
    php -S localhost:8080

# PASO 3: Si ninguno está disponible, mostrar error con instrucciones
else
    echo "❌ Error: Se requiere Python 3 o PHP"
    echo ""
    echo "📦 Para instalar Python 3 en macOS:"
    echo "   brew install python3"
    echo ""
    echo "📦 Para instalar PHP en macOS:"
    echo "   brew install php"
    echo ""
    exit 1
fi
