## Datatables:

Em vez de vários E's, cria uma tabela com todos os atributos de um objeto.
Funcionam como arrays, bom para vários conjuntos de elementos: Forms com muitos campos, testar compra de vários produtos.


### Antes:

feature:

Cenário: Iniciar a compra de um café

    Dado que estou na página inicial da Starbugs
        E que desejo comprar um "Expresso Gelado"
        E o preço do produto for "R$ 9,99"
        E a taxa de entrega for "R$ 10,00"
    Quando iniciar a compra desse item
    Então devo ver a pagina de Checkout com os detalhes do produto
        E o preço total deve ser "R$ 19,99"

### Depois:

feature:

Cenário: Iniciar a compra de um café

    Dado que estou na página inicial da Starbugs
        E que desejo comprar o seguinte produto:
            | product         | price   | delivery |
            | Expresso Gelado | R$ 9,99 | R$ 10,00 |
    Quando iniciar a compra desse item
    Então devo ver a pagina de Checkout com os detalhes do produto
        E o preço total deve ser "R$ 19,99"

steps:

```rb
Dado('que desejo comprar o seguinte produto:') do |table|
    @product_name = table.hashes[0]['product']
    @product_price = table.hashes[0]['price']
    @delivery_cost = table.hashes[0]['delivery']
end
```

## Hash de chave e valor, retorna apenas 1 obj:

feature:

Cenário: Iniciar a compra de um café

    Dado que estou na página inicial da Starbugs
        E que desejo comprar o seguinte produto:
            | product  | Expresso Gelado |
            | price    | R$ 9,99         |
            | delivery | R$ 10,00        |
    Quando iniciar a compra desse item
    Então devo ver a pagina de Checkout com os detalhes do produto
        E o preço total deve ser "R$ 19,99"

```rb
Dado('que desejo comprar o seguinte produto:') do |table|
    @product_name = table.rows_hash['product']
    @product_price = table.rows_hash['price']
    @delivery_cost = table.rows_hash['delivery']
end
```

ou

```rb
Dado('que desejo comprar o seguinte produto:') do |table|
    @product = table.rows_hash           # semelhante a uma dict em python
end

Quando('iniciar a compra desse item') do
    product = find('.coffee-item', text: @product[:name]) # busca o valor da chave name
    product.find('.buy-coffee').click
end

Então('devo ver a pagina de Checkout com os detalhes do produto') do
    product_title = find('.item-details h1')
    expect(product_title.text).to eql @product[:name] # busca o valor da chave name

    sub_price = find('.subtotal .sub-price')
    expect(sub_price.text).to eql @product[:price] # busca o valor da chave price

    delivery_price = find('.delivery .delivery-price')
    expect(delivery_price.text).to eql @product[:delivery] # busca o valor da chave delivery
end
```