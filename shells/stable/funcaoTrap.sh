#!/usr/bin/env bash

handle_ctrl_c(){
    echo "Você quer finalizar"; sleep 2s
    exit 0
}

# Função para lidar com a combinação de teclas Ctrl+Z
handle_ctrl_z() {
    echo "Combinação de teclas Ctrl+Z detectada. Realizando outra ação..."
    /usr/share/code/code --unity-launch %F
}

# Função para lidar com a combinação de teclas Ctrl+X
handle_ctrl_x() {
    echo "Combinação de teclas Ctrl+X detectada. Realizando outra ação..."
}

# Configurar o terminal para chamar a função correspondente quando as combinações de teclas forem pressionadas
trap handle_ctrl_c SIGINT
trap handle_ctrl_z SIGTSTP

# Exibir uma mensagem e continuar executando o script
echo "Pressione Ctrl+C, Ctrl+Z ou Ctrl+X para testar as ações personalizadas. O script continuará em execução..."

# Loop infinito para manter o script em execução
while true; do
    # Ler a entrada do usuário
    read -rsn1 input

    # Verificar a entrada do usuário usando um bloco case
    case "$input" in
        $'\x03')    # Combinação de teclas Ctrl+C (hex: 0x03)
            handle_ctrl_c
            ;;
        $'\x1A')    # Combinação de teclas Ctrl+Z (hex: 0x1A)
            handle_ctrl_z
            ;;
        $'\x18')    # Combinação de teclas Ctrl+X (hex: 0x18)
            handle_ctrl_x
            ;;
        $'\x7f')    # Tecla Delete (hex: 0x7f)
            echo "Tecla Delete pressionada. Realizando outra ação..."
            ;;
        $'\e')      # Tecla Esc (hex: 0x1B)
            echo "Tecla Esc pressionada. Realizando outra ação..."
            ;;
        *)          # Qualquer outra entrada
            echo "Entrada não reconhecida: $input"
            ;;
    esac
done
