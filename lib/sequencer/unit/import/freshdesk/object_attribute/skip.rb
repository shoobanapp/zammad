class Sequencer
  class Unit
    module Import
      module Freshdesk
        module ObjectAttribute
          class Skip < Sequencer::Unit::Base

            uses :resource
            provides :action

            def process
              return if !resource['default']

              state.provide(:action, :skipped)
            end
          end
        end
      end
    end
  end
end
