class CashRegister
# assigning attributes
    attr_accessor :item, :price, :quantity
    attr_reader :discount, :total, :items

# takes one optional argument, an employee discount, on initialization
    def initialize(discount = 0)
# sets an instance variable @total on initialization to zero
        @total = 0
        @discount = discount
        @items = []
    end
# total returns the current total
    def total=(total)
        @total = total
    end
# add_item accepts an item and a price and increases the total and also accepts an optional quantity
    def add_item(item, price, quantity = 1)
# doesn't forget about the previous total
        self.total += price * quantity
        quantity.times do
            @items << item
        end
        self.price = price
        self.quantity = quantity
    end
# apply_discount applies the discount to the total price
    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
             self.total = self.total * (1 - self.discount/100.0)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end
# items returns an array containing all items that have been added
    def items
        @items
    end
# void_last_transaction subtracts the last transaction from the total
    def void_last_transaction
        self.total -= self.price * self.quantity
    end
end

