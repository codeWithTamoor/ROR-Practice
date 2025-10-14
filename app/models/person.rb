class Person
  # --- 1. Include modules ---
  include ActiveModel::Model  
  include ActiveModel::Attributes
  include ActiveModel::AttributeAssignment
  include ActiveModel::AttributeMethods
  extend  ActiveModel::Callbacks
  include ActiveModel::Conversion

  attr_reader :first_name, :last_name
  define_attribute_methods :first_name, :last_name

  define_attribute_methods :name

  attribute :name, :string

  # for conversion
   attr_accessor :id, :name

  # --- 2. Declare callbacks ---
  define_model_callbacks :update

  before_update :reset_me
  after_update  :finalize_me
  around_update :log_me

  # --- 3. Declare custom attribute method patterns ---
  attribute_method_affix prefix: "reset_", suffix: "_to_default!"
  attribute_method_prefix "first_", "last_"
  attribute_method_suffix "_short?"

  # --- 4. Define model attributes ---
  attribute :name, :string
  attribute :date_of_birth, :date
  attribute :active, :boolean, default: true

  # --- 5. Generate dynamic methods ---
  define_attribute_methods :name, :date_of_birth, :active

  # --- 6. Custom attribute handlers ---

  def first_attribute(attribute)
    public_send(attribute).to_s.split.first
  end

  def last_attribute(attribute)
    public_send(attribute).to_s.split.last
  end

  def attribute_short?(attribute)
    public_send(attribute).to_s.length < 5
  end

  def reset_attribute_to_default!(attribute)
    public_send("#{attribute}=", "Default Name")
  end

  # --- 7. Callback example ---
  def update
    run_callbacks(:update) do
      puts "update method called"
    end
  end

  def persisted?
    @id.present?
  end


  private

  def reset_me
    puts "reset_me method: called before the update method"
  end

  def finalize_me
    puts "finalize_me method: called after the update method"
  end

  def log_me
    puts "log_me method: called around the update method"
    yield
    puts "log_me method: block successfully called"
  end


  def initialize
    @first_name = nil
    @last_name = nil
  end
   def name=(value)
    name_will_change! unless value == @name
    @name = value
  end

  def save
    changes_applied
  end

  def first_name=(value)
    first_name_will_change! unless value == @first_name
    @first_name = value
  end

  def last_name=(value)
    last_name_will_change! unless value == @last_name
    @last_name = value
  end

  def save
    # Persist data - clears dirty data and moves `changes` to `previous_changes`.
    changes_applied
  end

  def reload!
    # Clears all dirty data: current changes and previous changes.
    clear_changes_information
  end

  def rollback!
    # Restores all previous data of the provided attributes.
    restore_attributes
  end

end
