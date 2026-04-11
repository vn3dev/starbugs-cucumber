Quando('acesso a página inicial da Starbugs') do
    visit 'https://starbugs.vercel.app/'
end

Então('eu devo ver uma lista de cafés disponíveis') do
    products = all('.coffee-item')
    expect(products.size).to be > 0
end

Dado('que estou na página inicial da Starbugs') do
    visit 'https://starbugs.vercel.app/'
end

Dado('que desejo comprar o café {string}') do |product_name|
    @product_name = product_name
end

Dado('que esse produto custa {string}') do |product_price|
    @product_price = product_price
end

Dado('que o custo de entrega é de {string}') do |delivery_cost|
    @delivery_cost = delivery_cost
end

Quando('iniciar a compra desse item') do
    product = find('.coffee-item', text: @product_name)
    product.find('.buy-coffee').click
end

Então('devo ver a pagina de Checkout com os detalhes do produto') do
    product_title = find('.item-details h1')
    expect(product_title.text).to eql @product_name

    sub_price = find('.subtotal .sub-price')
    expect(sub_price.text).to eql @product_price

    delivery_price = find('.delivery .delivery-price')
    expect(delivery_price.text).to eql @delivery_cost
end

Então('o preço total deve ser {string}') do |total_price|
    total = find('.total .total-price')
    expect(total.text).to eql total_price
end

Então('devo ver uma mensagem de erro indicando que o café está indisponível') do
    popup = find('.swal2-html-container')
    expect(popup.text).to eql 'Produto indisponível'
end