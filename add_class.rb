module Add
  class Usual
    attr_accessor :sum, :term, :procent, :sum_procent, :next_mons

    def initialize(sum, term, procent)
      @term = term.to_f
      @sum = sum.to_f
      @procent = procent
      @sum_procent = 0
      @next_mons = sum.to_f
    end

    def debtRepayment
      @sum/@term
    end

    def creditBalance
      @next_mons = @next_mons - self.debtRepayment
    end

    def accruedInterest(check=TRUE)
      procent = @next_mons * (@procent.to_f / 100) / @term
      if check
        @sum_procent += procent
      end
      procent
    end
  end

  class Equal
    attr_accessor :sum, :term, :procent, :sum_procent, :next_mons

    def initialize(sum, term, procent)
      @term = term.to_f
      @sum = sum.to_f
      @procent = procent
      @sum_procent = 0
      @next_mons = sum.to_f
    end

    def sumPay
      p = @procent.to_f/100/12
      @sum * (p + p / ((1 + p) ** @term - 1))
    end

    def procPay(check=TRUE)
      procent = @next_mons * @procent.to_f / 100 /12
      if check
        @sum_procent += procent
      end
      procent
    end

    def creditPay
      self.sumPay - self.procPay(FALSE)
    end

    def resultPay
      @next_mons -= self.creditPay
    end
  end

end