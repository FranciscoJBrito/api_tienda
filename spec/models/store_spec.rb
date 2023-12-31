require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'Validaciones del modelo store' do
    subject { build(:store) } 
    it 'Validar si el name existe' do
      should validate_presence_of(:name)
    end
    
    it 'Validar si existe relacion con owner' do
      should have_one(:owner)
    end

    it 'Validar si existe relacion con employees' do
      should have_many(:employees)
    end

    it 'Validar si existe relacion con products' do
      should have_many(:products)
    end
  end
end
