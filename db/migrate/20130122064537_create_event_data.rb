class CreateEventData < ActiveRecord::Migration
  def change
    create_table :event_data do |t|
      t.datetime :tracked_at
      t.references :event, index: true

      t.timestamps
    end
  end
end
