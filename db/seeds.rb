languages = ['Inglês', 'Espanhol', 'Francês']
languages.each do |l|
  ForeignLanguage.create(:language => l)
end
