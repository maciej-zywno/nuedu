class AddStepRefToVideos < ActiveRecord::Migration
  def change
    add_reference :videos, :step, index: true
  end
end
