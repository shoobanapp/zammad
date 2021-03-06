class Sequencer
  class Sequence
    module Import
      module Freshdesk
        class ConnectionTest < Sequencer::Sequence::Base

          def self.expecting
            [:connected]
          end

          def self.sequence
            [
              'Freshdesk::Connected',
            ]
          end
        end
      end
    end
  end
end
