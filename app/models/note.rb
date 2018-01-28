class Note < ApplicationRecord
  attr_accessor :month, :day, :year
  TYPE_OPTIONS = {'note' => 1, 'goal' => 2}

  validates :title, presence: true, length: {maximum: 40, too_long: "%{count} characters is the maximum allowed"}
  validates_inclusion_of :type_of, presence: true, :in => TYPE_OPTIONS.values, :message => 'choose from the available options'
  validates :description, length: {maximum: 1000, too_long: "%{count} characters is the maximum allowed"}
  validate :validate_deadline


  def type_format(value)
    TYPE_OPTIONS.key(value)
  end


  def format_date(date_obj)
    date_obj.strftime("%m/%d/%Y %I:%M %p")
  end


  private

  def convert_deadline
    begin
      self.deadline = Date.civil(self.year.to_i, self.month.to_i, self.day.to_i)
    rescue ArgumentError
      false
    end
  end

  def validate_deadline
    errors.add(:deadline, "Deadline date is invalid.") unless convert_deadline
  end

end
