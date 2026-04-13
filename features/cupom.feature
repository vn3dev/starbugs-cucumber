#language: pt

Funcionalidade: Uso de Cupons no Checkout

    Como um usuário do site Starbugs, eu quero poder aplicar cupons de desconto na página de checkout
    Para que eu posa obter reduções no preço de produtos, aumentando a satisfação com a minha experiência de compra.

    @automacao
    Cenário: Aplicar Desconto de 20% PARA AUTOMAÇÃO

    Dado iniciei a compra do item:
        | name     | Café com Leite |
        | price    | R$ 19,99       |
        | delivery | R$ 10,00       |
        | total    | R$ 29,99       |
    Quando aplico o seguinte cupom: "MEUCAFE"
    Então o valor final da compra deve ser atualizado para "R$ 25,99"
        
    # Cenário: Aplicar Desconto de 20% PARA DEV

    # Dado que estou na página de checkout
    #     E o item que esta no meu carrinho é o Café com Leite no valor de R$ 19,99
    #     E que a taxa de entrega é de R$ 10,00
    #     E o valor total é de R$ 29,99
    #     E tenho um cupom com 20% de desconto
    # Quando aplico esse cupom de desconto
    # Então o desconto de 20% deve ser aplicado apenas no valor do Café com Leite
    #     E o valor final da compra deve ser atualizado para R$ 25,99

    @automacao
    Cenário: Cupom Expirado PARA AUTOMAÇÃO

    Dado iniciei a compra do item:
        | name     | Café com Leite |
        | price    | R$ 19,99       |
        | delivery | R$ 10,00       |
        | total    | R$ 29,99       |
    Quando aplico o seguinte cupom: "PROMO20"
    Então devo ver a notificação: "Cupom expirado!"
        E o valor final da compra deve permanecer o mesmo

    # Cenário: Cupom Expirado PARA DEV
    
    # Dado que estou na página de Checkout
    #     E o item que esta no meu carrinho é o Café com leite no valor de R$ 19,99
    #     E que a taxa de entrega é de R$ 10,00
    #     E o valor total é de R$ 29,99
    #     E tenho um cupom expirado com 20% de desconto "PROMO20"
    # Quando aplico esse cupom de desconto
    # Então devo ver a seguinte notificação: "Cupom Expirado"
    #     E o valor total da compra deve permanecer o mesmo

    @automacao
    Cenário: Cupom Inválido PARA AUTOMAÇÃO

    Dado iniciei a compra do item:
        | name     | Café com Leite |
        | price    | R$ 19,99       |
        | delivery | R$ 10,00       |
        | total    | R$ 29,99       |
    Quando aplico o seguinte cupom: "PROMO100"
    Então devo ver a notificação: "Cupom inválido!"
        E o valor final da compra deve permanecer o mesmo

    # Cenário: Cupom Inválido PARA DEV

    # Dado que estou na página de Checkout
    #     E o item que esta no meu carrinho é o Café com leite no valor de R$ 19,99
    #     E que a taxa de entrega é de R$ 10,00
    #     E o valor total é de R$ 29,99
    #     E tenho um cupom inválido com 20% de desconto "PROMO100"
    # Quando aplico esse cupom de desconto
    # Então devo ver a seguinte notificação: "Cupom Inválido"
    #     E o valor total da compra deve permanecer o mesmo