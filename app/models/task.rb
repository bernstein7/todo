# frozen_string_literal: true

class Task < ApplicationRecord
  enum status: { initial: 0, in_progress: 1, done: 2 }

  class << self
    def available
      all
    end
  end
end
