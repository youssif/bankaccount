class BankAccount
	attr_accessor :amount_available, :loan_taken

	@@total_money_in_accounts = 0

	@@total_loans_out = 0

	def self.transfer_money(account1,account2,amount)
		account1.amount_available = account1.amount_available - amount
		account2.amount_available = account2.amount_available + amount
		# puts "There are #{account1.amount} dollars left in the first account."
		# puts "There are #{account2.amount} dollars left in the first account."
	end

	def initialize
		@amount_available = 1000
		@@total_money_in_accounts += @amount_available
		@loan_taken = 0
		puts "You have #{@amount_available} dollars in your account."

	end

	def deposit_money(dollars)
		@amount_available = @amount_available + dollars
		@@total_money_in_accounts += dollars
	end

	def withdraw_money(dollars)
		@amount_available = @amount_available - dollars
		@@total_money_in_accounts -= dollars
	end

	def get_balance
		@amount_available
		puts "You have #{@amount_available} dollars left in your account."
	end

	def accrue_interest
		@loan_taken += (@loan_taken*0.06)
	end

	def take_loan(amount)
		@loan_taken += amount
		accrue_interest
		@amount_available += amount
		@@total_loans_out += amount
	end

	def repay_loan(amount)
		@loan_taken -= amount
		@amount_available -= amount
		@@total_loans_out -= amount
	end

	def accrue_interest
		@loan_taken += @loan_taken*0.06
	end

	def get_outstanding_loan
		puts "You have #{@loan_taken} dollars outsanding on your loan."
	end

	def self.total
		@@total_money_in_accounts
	end

	def self.total_loans
		@@total_loans_out
	end

	def self.total_cash_on_hand
		@@difference = @@total_money_in_accounts - @@total_loans_out
		puts "There is #{@@difference} total cash on hand."
	end

end