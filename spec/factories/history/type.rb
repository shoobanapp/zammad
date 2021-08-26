FactoryBot.define do
  factory :'history/type', aliases: %i[history_type] do
    name do
      # The following line ensures that the name generated by Faker
      # does not conflict with any existing names in the DB.
      # There's a special syntax for this
      # (Faker::Verb.unique.exclude(:past_participle, [], History::Type.pluck(:name)),
      # but it's not available yet in the current release of Faker (1.9.1).
      Faker::Verb.unique
                 .instance_variable_get(:@previous_results)[[:past_participle, []]]
                 .merge(History::Type.pluck(:name))

      Faker::Verb.unique.past_participle
    end
  end
end