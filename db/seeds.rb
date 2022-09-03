Section.all.each do |s|
  5.times do |t|
    s.create_book "#{s.Name} book_N#{t}"
  end
end

Section.create name: "История"
Section.create name: "Фантастика"
Section.create name: "Наука"

Section.all.each do |section|
  3.times do |time|
    Section.create name: "#{section.name} подсекция #{time + 1}", parent_id: section.id
  end
end

Section.all.each do |section|
  5.times do |time|
    section.books.create name: "Книга из секции (#{section.name}) номер #{time + 1}"
  end
end
