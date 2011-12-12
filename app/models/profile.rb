class Profile < ActiveRecord::Base

  #constants

  CIVIL_STATUS = ['Solteiro(a', 'Casado(a)', 'Separado(a)', 'Divorciado(a)', 'Viúvo(a)']
  STATES = ["AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA",
    "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO"]
  COUNTRIES = ["Brasil", "Afeganistão", "África do Sul", "Albânia", "Alemanha", "Andorra", "Angola", "Angula", "Antártida", "Antígua e Barbuda", "Antilhas Holandesas", "Arábia Saudita", "Argélia", "Argentina", "Armênia", "Aruba", "Austrália", "Áustria", "Azerbaijão", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Bélgica", "Belize", "Benin", "Bermuda", "Bósnia e Herzegovina", "Botsuana", "Brunei", "Bulgária", "Burkina Fasso", "Burundi", "Butão", "Cabo Verde", "Camarões", "Camboja", "Canadá", "Catar", "Cazaquistão", "Chade", "Chile", "China", "Chipre", "Cidade do Vaticano", "Cingapura", "Colômbia", "Comores", "Congo", "Coréia do Sul", "Costa do Marfim", "Costa Rica", "Croácia", "Cuba", "Djibuti", "Dominica", "Egito", "El Salvador", "Emirados Árabes Unidos", "Equador", "Eritréia", "Eslováquia", "Eslovênia", "Espanha", "Estados Unidos", "Estônia", "Etiópia", "Filipinas", "Finlândia", "França", "Gabão", "Gâmbia", "Gana", "Geórgia", "Gibraltar", "Grécia", "Grenada", "Guadalupe", "Guam", "Guatemala", "Guiana", "Guiana Francesa", "Guiné", "Guiné Equatorial", "Guiné-Bissau", "Haiti", "Holanda", "Honduras", "Hong Kong S. A. R", "Hungria", "Iêmen", "Ilha Bouvet", "Ilha Christmas", "Ilha Norfolk", "Ilhas Cayman", "Ilhas Cocos (Keeling)", "Ilhas Cook", "Ilhas Fiji", "Ilhas Geórgia do Sul e Sandwich do Sul", "Ilhas Heard e Ilhas McDonald", "Ilhas Malvinas (Falkland)", "Ilhas Marianas do Norte", "Ilhas Marshall", "Ilhas Salomão", "Ilhas Turks e Caicos", "Ilhas Virgens Americanas", "Ilhas Virgens Britânicas", "Índia", "Indonésia", "Irã", "Iraque", "Irlanda", "Israel", "Itália", "Iugoslávia", "Jamaica", "Japão", "Kiribati", "Kuwait", "Laos", "Lesoto", "Letônia", "Líbano", "Libéria", "Líbia", "Liechtenstein", "Lituânia", "Luxemburgo", "Macau S.A.R.", "Madagascar", "Malásia", "Malaui", "Maldivas", "Mali", "Malta", "Marrocos", "Martinica", "Maurício", "Mauritânia", "Mayotte", "México", "Micronésia", "Moçambique", "Moldávia", "Mônaco", "Mongólia", "Montserrat", "Myanmar", "Namíbia", "Nauru", "Nepal", "Nicarágua", "Níger", "Ninive", "Nova Caledônia", "Nova Zelândia", "Omã", "Palau", "Panamá", "Papua-Nova Guiné", "Paquistão", "Paraguai", "Peru", "Pitcairn", "Polinésia Francesa", "Polônia", "Porto Rico", "Portugal", "Quênia", "Quirguistão", "Reino Unido", "República Centro-Africana", "Macedônia", "República Dominicana", "República Tcheca", "Reunião", "Romênia", "Ruanda", "Rússia", "Saint-Pierre e Miquelon", "Samoa", "Samoa Americana", "San Marino", "Santa Helena", "Santa Lúcia", "São Tomé e Príncipe", "São Vicente e Granadinas", "Senegal", "Serra Leoa", "Seychelles", "Síria", "Somália", "Sri Lanka", "St. Kitts e Névis", "Suazilândia", "Sudão", "Suíça", "Suriname", "Svalbard", "Tadjiquistão", "Tailândia", "Taiwan", "Tanzânia", "Território Britânico do Oceano Índico", "Territórios Franceses do Sul", "Territórios Insulares dos EUA", "Timor Leste", "Togo", "Tokelau", "Tonga", "Trinidad e Tobago", "Tunísia", "Turcomenistão", "Turquia", "Tuvalu", "Ucrânia", "Uganda", "Uruguai", "Uzbequistão", "Vanuatu", "Venezuela", "Vietnã", "Wallis e Futuna", "Zâmbia", "Zimbábue"]
  BLOOD_TYPES = ['O-', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+']
  FORMATION_LEVELS = ['Fundamental', 1], ['Médio', 2], ['Superior', 3], ['Mestrado', 4], ['Doutorado', 5], ['Doutorado Direto', 6], ['Pós-Doutorado', 7], ['Livre Docente', 8]
  SCHOOL_TYPES = [['em escola pública', 1], ['em escola privada', 2] , ['ambos', 3]]
  UNIVERSITY_TYPES = [['em universidade/faculdade pública', 4], ['em universidade/faculdade privada', 5] , ['ambos', 6]]
  COMPUTER_LEVELS = [['avançado', 1], ['intermediário', 2], ['básico', 3], ['nenhum', 4]]
  COURSE_STATUS = [['Concluído', 1], ['Interrompido', 2], ['Em conclusão', 3]]
  COURSE_PERIODS = [['Matutino', 1], ['Noturno', 2]]

  has_many :emergency_contacts, :dependent => :destroy
  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :interesting_topics
  has_and_belongs_to_many :work_topics
  has_many :languages
  has_many :foreign_languages, :through => :languages
  has_many :social_moviments
  has_many :public_schools
  has_attached_file :curriculum

  accepts_nested_attributes_for :emergency_contacts, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :languages, :reject_if => lambda { |a| a[:level].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :social_moviments, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :public_schools, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  validates_attachment_content_type :curriculum,
    :content_type => ['application/msword', 'application/vnd.oasis.opendocument.text', 
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'text/plain', 
      'application/pdf', 'application/x-pdf'],
    :message => 'inválido, inclua o seu curriculum em um dos seguintes formatos: pdf, odt, doc ou txt'
  validates_presence_of :name
end
