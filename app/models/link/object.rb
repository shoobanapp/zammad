# Copyright (C) 2012-2016 Zammad Foundation, http://zammad-foundation.org/

class Link::Object < ApplicationModel
  include ChecksHtmlSanitized

  validates :name, presence: true

  sanitized_html :note
end
