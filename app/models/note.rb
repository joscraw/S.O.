# Note class that is responsible for holding a given note or goal.
# Also performs basic validation and formatting of certain properties.
#
# @author Josh Crawmer
# @attr [String] title The title for the note.
# @attr [Integer] type_of The type of note. Look at TYPE_OPTIONS below.
# Stored in database as integer but formatted and displayed as string
# @attr [String] description Optional description for note.
# @attr [Date] deadline Deadline only gets displayed when the type_of note is "goal".
# @attr [String] month Only used for goals.
# @attr [String] day Only used for goals.
# @attr [String] year Only used for goals.
#
class Note < ApplicationRecord
  attr_accessor :month, :day, :year
  TYPE_OPTIONS = {'note' => 1, 'goal' => 2}


  validates :title, presence: true, length: {maximum: 40, too_long: "%{count} characters is the maximum allowed"}
  validates_inclusion_of :type_of, presence: true, :in => TYPE_OPTIONS.values, :message => 'choose from the available options'
  validates :description, length: {maximum: 1000, too_long: "%{count} characters is the maximum allowed"}
  validate :validate_deadline


  # Accepts an integer value and returns
  # a string value from the TYPE_OPTIONS hash
  #
  # @param [Integer] value
  # @return [String]
  def type_format(value)
    TYPE_OPTIONS.key(value)
  end


  # Accepts a date object and returns a nicely formatted string
  #
  # @param [DateTime, Date] date_obj
  # @return [String]
  def format_date(date_obj)
    date_obj.strftime("%m/%d/%Y %I:%M %p")
  end


  private

  # Sets the deadline and converts in to date object
  # or returns false if there was an issue
  #
  # @return [String, Boolean]
  def convert_deadline
    begin
      self.deadline = Date.civil(self.year.to_i, self.month.to_i, self.day.to_i)
    rescue ArgumentError
      false
    end
  end


  # validates the deadline
  #
  # @return [Array]
  def validate_deadline
    # only validate the date if the type of note is a goal
    if self.type_of === 2
      errors.add(:deadline, "Deadline date is invalid.") unless convert_deadline
    end
  end


end
