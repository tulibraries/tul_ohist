module TagMatchers

  RSpec::Matchers.define :have_tag do |tag|
    match do |doc|
      doc.search(tag).any?
    end
  end

end