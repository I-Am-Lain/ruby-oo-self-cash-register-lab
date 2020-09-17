
class CashRegister
    attr_accessor :total
    attr_reader :discount, :total


    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @@all_items = []
        @@all_prices = []    # my super sneaky variable
        @@all_quantities = []  # my really bad variable
    end

    def add_item(title, price, quantity = 1)
        self.total += price*quantity
        quantity.times do
            @@all_items << title
            @@all_prices << price
            @@all_quantities << quantity
        end
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        end

        self.total *= (1 - (self.discount/100.0))
        return "After the discount, the total comes to $#{self.total.to_i}."
    end

    def items
        @@all_items
    end

    def void_last_transaction
        self.total -= @@all_prices.last

        @@all_quantities.last.times do
            @@all_items.pop
        end

        
        if @@all_items == []
            self.total = 0.0
        end

    end
end
