class Question < ActiveRecord::Base
	belongs_to :user
	validates :description, :presence => {:message => "Usted debe ingresar un comentario"}, length: {minimum: 2, maximum: 4000, :message => "El comentario debe tener entre 2 y 4000 caracteres"}
end
