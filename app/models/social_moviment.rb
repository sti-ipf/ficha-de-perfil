class SocialMoviment < ActiveRecord::Base
  belongs_to :profile

  TYPES = [['Habitação/moradia', 1], ['Direitos Humanos', 2], ['Educação', 3], ['Economia Solidária', 4], 
      ['Comunicação', 5], ['Defesa das crianças e dos adolescentes', 6], ['Software Livre', 7],
      ['Educação socioambiental', 8], ['Democracia Participativa', 9], ['Fórum Social Mundial', 10], 
      ['Diversidade', 11], ['Inclusão digital', 12], ['Fórum Mundial de Educação', 13], ['Juventude', 14]
    ]

end
