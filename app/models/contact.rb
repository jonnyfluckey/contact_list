class Contact < ApplicationRecord
  #Associations
  #belongs_to
  #has_many
  #has_one
  #has_many :through
  #has_one :through
  #dependent
  has_many :note, dependent: :destroy
  has_one :address, dependent: :destroy

  #Validations
    # confirmation
      # validates :password, confirmation: true
    # inclusion
      # what can been included
    #   validates :size, inclusion: { 
    #     in: %w(small medium large),
    #       message: "%{value} is not a valid size" 
    #   }
    # end
    # length
      #specifies length of string
      # validates :phone, length: { maximum: 10 }
      # validates :phone, length: { mimimum: 7 }
      validates :phone, length: { in 7..10 }
    # numericality
      #validates :age, numericality: true
      #validates :age, numericality: { only_integer: true }
      validates :age, numericality: { greater_than_or_equal_to: 21, less_than_or_equal_to: 150 }
    # presence
      validates :age, :phone, :email, :first_name, :last_name presence: true, on: :create, on: :save, on: :update
    # uniqueness
      validates :email, uniqueness: true, allow_nil: true, allow_blank: false

  #Validation options
    #allow_nil
    #allow_blank
    #message
    #on

  #Callbacks
    # before_validation
    # after_validation
    # before_save
    # after_save
    # around_save
    # before_create
    # after_create
    # around_create

    before_save: :set_age

    private
      def set_age
        self.age = 18
      end
end
