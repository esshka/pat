# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  done       :boolean
#  project_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base

  belongs_to :project
  has_many :logs, dependent: :destroy

  validates :name, presence: { message: I18n.t(:please_provide_name) }
  validates_presence_of :project

  def work?
    !logs.empty? && !logs.first.stop
  end

  def logged
    logs.map(&:duration).sum
  end

end
