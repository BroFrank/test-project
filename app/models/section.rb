class Section < ApplicationRecord
  has_many :books, dependent: :destroy

  def self.all_parents
    Section.find_by_sql("SELECT * FROM sections WHERE parent_id IS NULL")
  end

  def sub_sections
    Section.find_by_sql("SELECT * FROM sections WHERE parent_id IS #{self.id}")
  end

  def get_books
    if is_parent?
      id = self.id
      sql = "
        SELECT *
        FROM books
        WHERE section_id = #{id} OR section_id IN (
          SELECT id
          FROM sections
          WHERE parent_id = #{id}
        )
      "
      Section.find_by_sql sql
    else
      self.books
    end
  end

  private

  def is_parent?
    self.parent_id == nil ? true : false
  end
end
