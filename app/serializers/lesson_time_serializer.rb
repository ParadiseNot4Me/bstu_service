class LessonTimeSerializer < ActiveModel::Serializer
  attributes :start, :end

  def start
  	object.start.to_s(:time) 
  end

  def end
  	object.end.to_s(:time) 
  end
end
