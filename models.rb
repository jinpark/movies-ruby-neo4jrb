class Engagement
  include Neo4j::ActiveRel
  property :roles  # this contains an array of roles
  from_class 'Person'
  to_class 'Movie'
  type :ACTED_IN
end

class Episode
  include Neo4j::ActiveNode
  id_property :title
  property :episode_number
  has_many :in, :actors, model_class: :Person, rel_class: 'Engagement'
  has_many :in, :directors, model_class: :Person, type: :DIRECTED
  has_many :in, :writers, model_class: :Person, type: :WRITTEN
  has_many :in, :keywords, model_class: :Keyword, type: :KEYWORD
  has_one :in, :seasons, model_class: :Season, type: :SEASON
end

class Person
  include Neo4j::ActiveNode
  id_property :name
  property :character
  has_many :out, :acted_in, model_class: :Episode, rel_class: 'Engagement'
  has_many :out, :directed, model_class: :Episode, type: :DIRECTED
  has_many :out, :written, model_class: :Episode, type: :WRITTEN
end

class Keyword
  include Neo4j::ActiveNode
  id_property :keyword
  has_many :out, :plot_point, model_class: :Episode, type: :KEYWORD
end

class Season
  include Neo4j::ActiveNode
  id_property :number
  has_many :out, :episodes, model_class: :Episode, type: :EPISODE
end
