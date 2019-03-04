class CategoryRepository < Hanami::Repository
  associations do
    has_many :secrets
  end

  def all_for_select_hash
    select_hash = {}
    root.select(:title, :id).map_to(Category).to_a.each { |c| select_hash[c.title] = c.id  }
    select_hash
  end

  def find_by_title(title)
    root.where(title: title).limit(1).one
  end
end
