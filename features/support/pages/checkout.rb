require 'rspec'

class CheckoutPage
    include Capybara::DSL
    include RSpec::Matchers

    def assert_product_details(product)
        product_title = find('.item-details h1')
        expect(product_title.text).to eql product[:name]

        sub_price = find('.subtotal .sub-price')
        expect(sub_price.text).to eql product[:price]

        delivery_price = find('.delivery .delivery-price')
        expect(delivery_price.text).to eql product[:delivery]
    end

    def checkout_price(total_price)
        total = find('.total .total-price')
        expect(total.text).to eql total_price
    end

    def find_zipcode(zipcode)
        find('input[name=cep]').set(zipcode)
        click_on 'Buscar CEP'
    end

    def fill_address(address)
        find('input[name=number]').set(address[:number])
        find('input[name=complement]').set(address[:details])
    end

    def choice_payment(payment_type)
        find('label div', text: payment_type.upcase).click
    end

    def submit
        click_on 'Confirmar pedido'
    end

    def visit_qa
        visit 'https://starbugs-qa.vercel.app'
    end

    def add_cupom(cupom)
        find('input[placeholder="Código do cupom"]').set(cupom)
        click_on 'Aplicar'
    end

    def check_final_price(total)
        final_price = find('.total .total-price')
        expect(final_price.text).to eql total
    end

    def expired_cupom_message(message)
        find('.notice').text
        expect(find('.notice').text).to eql message
    end
end