require 'rails_helper'

RSpec.describe BankAccount, type: :model do

  let(:valid_attributes) {
    { institution: 'Chase', amount: 200, active: true, ledger: 300}
  }

  describe 'attributes' do
    it { should respond_to :amount }
    it { should respond_to :institution }
    it { should respond_to :ledger }
    it { should respond_to :active }
    it { should respond_to :description }
  end

  describe 'serialization' do
    it { should serialize(:ledger) }
  end

  describe 'ledger' do
    before(:each) do
      @user = User.create(first_name: 'Test', last_name: 'Tester', gender: 'Male', age: 32)
      @bank_account = BankAccount.create(amount: 2000, institution: 'Wells Fargo', active: true, description: 'Henlo worl', user_id: @user.id)
    end

    it 'initializes ledger' do
      expect(@bank_account.ledger).to eq([])
    end

    it 'updates ledger' do
      @bank_account.update(amount: 100)
      expect(@bank_account.ledger).to eq([])
    end
  end
end
