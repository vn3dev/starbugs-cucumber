Quando('acesso a página inicial da Starbugs') do
    @home.open
end

Então('eu devo ver uma lista de cafés disponíveis') do
    expect(@home.coffee_list.size).to be > 0
end

Dado('que estou na página inicial da Starbugs') do
    @home.open
end

Dado('que desejo comprar o seguinte produto:') do |table|
    @product = table.rows_hash
end

Quando('iniciar a compra desse item') do
    @home.buy(@product[:name])
end

Então('devo ver a pagina de Checkout com os detalhes do produto') do
    @checkout.assert_product_details(@product)
end

Então('o preço total deve ser {string}') do |total_price|
    @checkout.checkout_price(total_price)
end

Então('devo ver uma mensagem de erro indicando que o café está indisponível') do
    @popup.have_text('Produto indisponível')
end