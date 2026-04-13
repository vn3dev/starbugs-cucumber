Dado('iniciei a compra do item:') do |table|
    @product = table.rows_hash

    @checkout.visit_qa
    @home.buy(@product[:name])
end

Quando('aplico o seguinte cupom: {string}') do |cupom|
    @checkout.add_cupom(cupom)
end

Então('o valor final da compra deve ser atualizado para {string}') do |total_price|
    @checkout.check_final_price(total_price)
end

Então('devo ver a notificação: {string}') do |message|
    @checkout.expired_cupom_message(message)
end

Então('o valor final da compra deve permanecer o mesmo') do
    @checkout.check_final_price(@product[:total])
end