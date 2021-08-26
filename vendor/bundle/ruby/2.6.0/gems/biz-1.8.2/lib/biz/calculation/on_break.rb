# frozen_string_literal: true

module Biz
  module Calculation
    class OnBreak

      def initialize(schedule, time)
        @schedule = schedule
        @time     = time
      end

      def result
        schedule.breaks.any? { |brake| brake.contains?(time) }
      end

      private

      attr_reader :schedule,
                  :time

    end
  end
end
