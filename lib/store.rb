class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
end

private

  def uppercase_words
    self.survey_title=(self.survey_title.split.map(&:capitalize).join(' '))
  end
