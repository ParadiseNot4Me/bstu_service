class SubjectSerializer < ActiveModel::Serializer
  attributes :name, :teacher
  
  def teacher
  	if (object.lesson_type == "Практика")
  		object.practic_teacher
  	else
  		object.teacher
  	end
  end
end
