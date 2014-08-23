# == Schema Information
#
# Table name: projects
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Project < ActiveRecord::Base

  has_many :tasks, dependent: :destroy
  has_many :logs, through: :tasks

  validates :name, presence: { message: I18n.t(:please_provide_name) }

  def logged
    logs.map(&:duration).sum
  end

end
