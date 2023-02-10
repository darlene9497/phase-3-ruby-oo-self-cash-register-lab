class CashRegister
    attr_accessor :item, :price, :quantity
    attr_reader :discount, :total, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def total=(total)
        @total = total
    end

    def add_item(item, price, quantity = 1)
        self.total += price * quantity
        quantity.times do
            @items << item
        end
        self.price = price
        self.quantity = quantity
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
             self.total = self.total * (1 - self.discount/100.0)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.price * self.quantity
    end
end

