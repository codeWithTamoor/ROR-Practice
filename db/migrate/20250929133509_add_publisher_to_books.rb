class AddPublisherToBooks < ActiveRecord::Migration[8.0]
  def change
    # Step 1: allow nulls temporarily
    add_reference :books, :publisher, null: true, foreign_key: true

    # Step 2: assign a default publisher to existing books
    Book.reset_column_information
    default_publisher = Publisher.first || Publisher.create!(name: "Default Publisher")
    Book.update_all(publisher_id: default_publisher.id)

    # Step 3: enforce NOT NULL constraint
    change_column_null :books, :publisher_id, false
  #enddd_reference :books, :publisher, null: false, foreign_key: true
  end
end
