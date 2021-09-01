class Gym < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships

  def join_gym(member, start_year, start_month)
    Membership.create(member: member, start_year: start_year, start_month: start_month, gym: self)
  end

  def print_all_memberships
    memberships.each(&:print_membership)
  end

  def first_member
    members.order(:start_year).first
  end

  def gym_value
    rating.to_f / price
  end

  def self.best_value
    all.map { |gym| gym.gym_value }.max
  end

end
