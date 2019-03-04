class SecretRepository < Hanami::Repository
  def find_by_category(id)
    root.where(category_id: id).map_to(Secret).to_a
  end
end
