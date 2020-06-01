# frozen_string_literal: true

class AddDiscardedAtToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :course, :discarded_at, :datetime
    add_index :course, :discarded_at
  end
end
