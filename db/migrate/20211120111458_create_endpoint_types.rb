class CreateEndpointTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :endpoint_types do |t|
      t.string :name, null: false
      t.string :request_type, null: false
    end
  end
end
