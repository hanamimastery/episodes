class CreateOnboardingRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :onboarding_registrations do |t|

      t.timestamps
    end
  end
end
