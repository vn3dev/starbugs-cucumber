#language: pt

Funcionalidade: Catálogo de cafés
  Como um cliente eu quero ver o catálogo de cafés na página inicial
  Para que eu possa escolher e saber mais sobre os cafés disponíveis

Cenário: Acessar o catálogo de cafés na página inicial

    Quando acesso a página inicial da Starbugs
    Então eu devo ver uma lista de cafés disponíveis

Cenário: Iniciar a compra de um café

    Dado que estou na página inicial da Starbugs
        E que desejo comprar o café "Expresso Gelado"
        E que esse produto custa "R$ 9,99"
        E que o custo de entrega é de "R$ 10,00"
    Quando iniciar a compra desse item
    Então devo ver a pagina de Checkout com os detalhes do produto
        E o preço total deve ser "R$ 19,99"

Cenário: Café indisponível

    Dado que estou na página inicial da Starbugs
        E que desejo comprar o café "Expresso Cremoso"
    Quando iniciar a compra desse item
    Então devo ver uma mensagem de erro indicando que o café está indisponível