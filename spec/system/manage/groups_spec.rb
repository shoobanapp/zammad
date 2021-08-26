require 'rails_helper'
require 'system/examples/pagination_examples'

RSpec.describe 'Manage > Groups', type: :system do
  context 'ajax pagination' do
    include_examples 'pagination', model: :group, klass: Group, path: 'manage/groups'
  end
end
