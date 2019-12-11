require "pry"

class CashRegister
    attr_accessor :total, :discount, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item,cost,quantity = 1)
        self.total += cost * quantity
        i = 0
        while i < quantity 
            @items << item
            i += 1
        end
        self.last_transaction = cost * quantity
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = (self.total * ((100 - discount.to_f)/100)).to_i
            #binding.pry
            "After the discount, the total comes to $#{total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end
