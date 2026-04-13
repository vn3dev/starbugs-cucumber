
require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/order.rb'
require_relative './pages/components.rb'

Before do
    @home = HomePage.new
    @checkout = CheckoutPage.new
    @order = OrderPage.new
    @popup = Popup.new
end

After do
    screenshot = page.save_screenshot("log/screenshot-#{Time.now.strftime("%Y-%m-%d-%H-%M-%S")}.png")
    attach(screenshot, 'image/png', "Screenshot")
end