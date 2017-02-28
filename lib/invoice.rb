require_relative "../lib/data_access"

class Invoice
  include DataAccess
  #do attr_readers from  interfere with each other?
  #it seems wherever you put readers, it initializes, either here, or in module. 
  # attr_reader :customer_id, :status

  # def initialize
  #   @customer_id = data[:customer_id]
  # end



###
#duplicated from Item. Should we move to data_access?
###
  def merchant
    parent.parent.merchants.find_by_id(merchant_id)
  end

  def items
    all_invoices = parent.parent.invoice_items.find_all_by_invoice_id(id)
    item_ids = all_invoices.map { |invoice_item| invoice_item.item_id }
    item_ids.map {|item_id| self.parent.parent.items.find_by_id(item_id) }
  end

  def transactions
    parent.parent.transactions.find_all_by_invoice_id(id)
  end

  def customer
    parent.parent.customers.find_by_id(customer_id)
  end


end