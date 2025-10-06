class CustomersController<ApplicationController
  def index
    @customers=Customer.all
    @customer=Customer.find(params(:review_id))
    @order=@customer.orders
  end
end
